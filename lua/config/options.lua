-- UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation and whitespace
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindent = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣"
}

-- Mouse and clipboard
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Performance
vim.opt.lazyredraw = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- File history
vim.opt.undofile = true

-- Completion
vim.opt.completeopt = "menuone,noselect"

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  signs = true,
  update_in_insert = false,
  underline = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true
  }
})
