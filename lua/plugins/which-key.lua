return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	opts = {
		icons = {
			mappings = vim.g.have_nerd_font,
		},
		preset = "modern",

		spec = {
			{
				"<leader>a",
				group = "[A]i Code",
				icon = "󱙺",
			},
			{
				"<leader>c",
				group = "[C]ode",
				mode = { "n", "x" },
			},
			{
				"<leader>b",
				group = "De[B]ug",
				icon = "",
			},
			{
				"<leader>d",
				group = "[D]ocument",
			},
			{
				"<leader>r",
				group = "[R]ename",
			},
			{
				"<leader>s",
				group = "[S]earch",
			},
			{
				"<leader>w",
				group = "[W]orkspace",
			},
			{
				"<leader>t",
				group = "[T]oggle",
			},
			{
				"<leader>h",
				group = "Git [H]unk",
				mode = { "n", "v" },
			},
		},
	},
}
