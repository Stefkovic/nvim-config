-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.colemak")

require("lazy").setup({
    spec = {{
        import = "plugins"
    }},
    install = {
        colorscheme = {"catppuccin-mocha"}
    },
    checker = {
        enabled = true
    },
    rocks = {
        enabled = false
    }
})

-- Netrw settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI settings
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true

-- Search settings
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indentation and whitespace
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.breakindent = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

-- Mouse and clipboard
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- Performance
vim.o.lazyredraw = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Spell checking
vim.o.spell = false
vim.o.spelllang = 'en_us'

-- File history
vim.o.undofile = true

-- Completion
vim.o.completeopt = "menuone,noselect"

-- Path
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- File types
vim.filetype.add({
    extension = {
        templ = "templ"
    }
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
        clear = true
    }),
    callback = function()
        vim.highlight.on_yank({
            timeout = 250
        })
    end
})

-- Templ autoformat on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.templ"},
    callback = vim.lsp.buf.format
})
