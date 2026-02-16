return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    init = function()
      -- Add Mason bin to PATH early so vim.fn.executable() finds installed tools
      local bin = vim.fn.stdpath("data") .. "/mason/bin"
      if not vim.env.PATH:find(bin, 1, true) then
        vim.env.PATH = bin .. ":" .. vim.env.PATH
      end
    end,
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "gopls",
        "intelephense",
        -- Formatters
        "stylua",
        "gofumpt",
        "goimports",
        "prettierd",
        "prettier",
        "pint",
      },
    },
  },
}
