return {
	"swaits/zellij-nav.nvim",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<C-Left>", "<cmd>ZellijNavigateLeftTab<cr>", desc = "Navigate Left (or Tab)" },
		{ "<C-Down>", "<cmd>ZellijNavigateDownTab<cr>", desc = "Navigate Down" },
		{ "<C-Up>", "<cmd>ZellijNavigateUpTab<cr>", desc = "Navigate Up" },
		{ "<C-Right>", "<cmd>ZellijNavigateRightTab<cr>", desc = "Navigate Right (or Tab)" },
	},
	opts = {},
}
