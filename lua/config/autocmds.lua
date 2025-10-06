-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("format-on-save", { clear = true }),
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 3000 })
  end,
})

-- Detect Blade files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
  end,
})
