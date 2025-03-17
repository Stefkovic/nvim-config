return {
	"nvim-neotest/neotest",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-neotest/neotest-go" },
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-go")({
					args = { "-race", "-count=1", "-timeout=60s" },
				}),
			},
			quickfix = {
				enabled = true,
				open = false,
			},
			output = {
				open_on_run = true,
			},
		})

		-- Example key mappings
		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end, {
			desc = "Run nearest test",
		})
		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, {
			desc = "Run tests in file",
		})
		vim.keymap.set("n", "<leader>ts", function()
			neotest.summary.toggle()
		end, {
			desc = "Toggle test summary",
		})
		vim.keymap.set("n", "<leader>to", function()
			neotest.output.open({
				enter = true,
			})
		end, {
			desc = "Show test output",
		})
	end,
}
