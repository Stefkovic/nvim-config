return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>f", group = "Find", icon = "󰍉 " },
			{ "<leader>c", group = "Code", icon = " " },
			{ "<leader>q", group = "Session", icon = "󰦛 " },
			{ "<leader>a", group = "AI", icon = "󰚩 " },
			{ "<leader>w", group = "Workspace", icon = "󰏓 " },
			{ "<leader>r", group = "Refactor", icon = "󰑕 " },
			{ "<leader>s", group = "Swap", icon = "󰓡 " },
			{ "<leader>l", group = "Laravel", icon = "󰫐 " },
			{ "<leader>g", group = "Git", icon = "󰊢 " },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
