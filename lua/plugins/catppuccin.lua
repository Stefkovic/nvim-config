return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		integrations = {
			cmp = true,
			gitsigns = true,
			which_key = true,
			mason = true,
			native_lsp = {
				enabled = true,
			},
			dap = {
				enabled = true,
				enable_ui = true,
			},
			treesitter = true,
			nvimtree = true,
		},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
