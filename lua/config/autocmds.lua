-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
})

-- Format on save (prefer conform, fallback to LSP)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("format-on-save", { clear = true }),
  callback = function(args)
    local has_conform, conform = pcall(require, "conform")
    if has_conform then
      conform.format({ bufnr = args.buf, timeout_ms = 3000, lsp_fallback = true })
    else
      vim.lsp.buf.format({
        bufnr = args.buf,
        timeout_ms = 3000,
        filter = function(client)
          return client.supports_method("textDocument/formatting")
        end,
      })
    end
  end,
})

-- Detect Blade files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
  end,
})
