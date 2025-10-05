-- Leader keys (must be set before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configuration
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.lsp")
