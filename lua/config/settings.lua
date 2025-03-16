-- Leader key
vim.g.mapleader = " " -- Set space as the leader key
vim.g.maplocalleader = " " -- Set space as the local leader key

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Display settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.showmode = false -- Don't show mode (--INSERT--, --VISUAL--) in command line
vim.o.cursorline = true -- Highlight current line
vim.o.signcolumn = 'yes' -- Always show sign column (for git signs, diagnostics)
vim.o.list = true -- Show invisible characters
vim.o.termguicolors = true -- Enable true color support
vim.g.have_nerd_font = true -- Enable nerd font support
vim.opt.listchars = {
    tab = '» ', -- Show tabs as »
    trail = '·', -- Show trailing spaces as ·
    nbsp = '␣' -- Show non-breaking spaces as ␣
}

-- Performance settings
vim.o.lazyredraw = true -- Don't redraw screen during macros
vim.o.updatetime = 250 -- Faster completion and cursor hold events (ms)
vim.o.timeoutlen = 300 -- Time to wait for mapped sequence to complete (ms)

-- Editor behavior
vim.o.scrolloff = 10 -- Keep 10 lines visible above/below cursor
vim.o.confirm = true -- Ask for confirmation instead of erroring
vim.o.splitright = true -- New vertical splits open to the right
vim.o.splitbelow = true -- New horizontal splits open below
vim.o.breakindent = true -- Wrapped lines preserve indentation
vim.o.undofile = true -- Save undo history to file

-- Indentation settings
vim.o.tabstop = 4 -- 4 spaces for tabs
vim.o.shiftwidth = 4 -- 4 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.o.smartindent = true -- Smart autoindenting on new lines

-- Search settings
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true -- Case-insensitive unless capital letters are used
vim.o.inccommand = 'split' -- Preview substitutions live
vim.o.hlsearch = true -- Highlight search matches
vim.o.incsearch = true -- Show matches while typing

-- Command-line completion
vim.o.wildmenu = true -- Enhanced command-line completion

-- Folding settings
vim.o.foldmethod = 'indent' -- Fold based on indentation
vim.o.foldlevelstart = 99 -- Start with all folds open

-- Spell checking
vim.o.spell = false -- Spell checking off by default
vim.o.spelllang = 'en_us' -- Default language for spell checking

--  Clipboard settings
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus' -- Use system clipboard for all operations
end)

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
vim.filetype.add({
    extension = {
        templ = "templ"
    }
})
