return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons", "neovim/nvim-lspconfig" },
	opts = {
		fzf_opts = {
			["--layout"] = "default",
		},
		files = {
			fd_opts = "--hidden --follow --exclude .git",
		},
		grep = {
			rg_opts = "--column --line-number --no-heading --color=always --smart-case",
		},
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		require("fzf-lua").register_ui_select()
	end,
	keys = {
		{
			"<leader>ff",
			"<cmd>FzfLua files<cr>",
			desc = "Find Files",
		},
		{
			"<leader>fc",
			"<cmd>FzfLua lsp_live_workspace_symbols<cr>",
			desc = "Find LSP",
		},
		{
			"<leader>fg",
			"<cmd>FzfLua live_grep<cr>",
			desc = "Find Grep",
		},
		{
			"<leader>fC",
			"<cmd>FzfLua commands<cr>",
			desc = "Neovim Commands",
		},
		{
			"<leader>fd",
			"<cmd>FzfLua dap_commands<cr>",
			desc = "Debug Commands",
		},
		{
			"<leader>fn",
			"<cmd>FzfLua files cwd=~/.config/nvim<cr>",
			desc = "Neovim Files",
		},
	},
}
