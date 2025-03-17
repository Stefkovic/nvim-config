return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		format_on_save = {
			lsp_format = "fallback",
			timeout = 500,
		},
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			php = { "php-cs-fixer" },
		},
	},
}
