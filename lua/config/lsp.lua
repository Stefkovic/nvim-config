local servers = { "lua", "go", "php" }

local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "gr", vim.lsp.buf.references, "Go to References")
  map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "<leader>rn", function() Snacks.rename.rename_file() end, "Rename File")
  map("n", "<leader>rs", vim.lsp.buf.rename, "Rename Symbol")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>cf", function()
    local has_conform, conform = pcall(require, "conform")
    if has_conform then
      conform.format({ timeout_ms = 3000, lsp_fallback = true })
    else
      vim.lsp.buf.format({ timeout_ms = 3000 })
    end
  end, "Format Buffer")
  map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  map("n", "<leader>e", vim.diagnostic.open_float, "Show Diagnostic")
  map("n", "gt", vim.lsp.buf.type_definition, "Type Definition")
  map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to Loclist")
  map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")

  -- Enable inlay hints if supported
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

local function find_root(bufnr, patterns)
  return vim.fs.root(bufnr, patterns) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)) or vim.uv.cwd()
end

-- Get LSP capabilities from blink.cmp
local function get_capabilities()
  local has_blink, blink = pcall(require, "blink.cmp")
  if has_blink then
    return blink.get_lsp_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end

-- Track notified missing servers to avoid spam
local notified_missing = {}

-- Auto-start LSP on filetype
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(args)
    for _, server in ipairs(servers) do
      local config = require("lsp." .. server)
      for _, ft in ipairs(config.filetypes) do
        if ft == vim.bo[args.buf].filetype then
          if vim.fn.executable(config.cmd[1]) == 1 then
            vim.lsp.start({
              name = config.name or server,
              cmd = config.cmd,
              root_dir = find_root(args.buf, config.root_markers),
              settings = config.settings,
              capabilities = get_capabilities(),
              on_attach = on_attach,
            }, {
              bufnr = args.buf,
              reuse_client = function(client, conf)
                return client.name == (config.name or server) and client.config.root_dir == conf.root_dir
              end,
            })
          else
            -- Only notify once per server per session
            if not notified_missing[config.cmd[1]] then
              notified_missing[config.cmd[1]] = true
              vim.notify(
                string.format("LSP server '%s' not installed\nCommand '%s' not found", config.name or server,
                  config.cmd[1]),
                vim.log.levels.WARN,
                { title = "LSP Missing" }
              )
            end
          end
          break
        end
      end
    end
  end,
})
