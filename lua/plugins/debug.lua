return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{
			"<leader>bc",
			function()
				require("dap").continue()
			end,
			desc = "De[B]ug: Start/[C]ontinue",
		},
		{
			"<leader>bi",
			function()
				require("dap").step_into()
			end,
			desc = "De[B]ug: Step [I]nto",
		},
		{
			"<leader>bo",
			function()
				require("dap").step_over()
			end,
			desc = "De[B]ug: Step [O]ver",
		},
		{
			"<leader>be",
			function()
				require("dap").step_out()
			end,
			desc = "De[B]ug: Step Out - [E]xit",
		},
		{
			"<leader>bb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "De[B]ug: Toggle [B]reakpoint",
		},
		{
			"<leader>bc",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "De[B]ug: Set [C]onditional Breakpoint",
		},
		{
			"<leader>bt",
			function()
				require("dapui").toggle()
			end,
			desc = "De[B]ug: [T]oggle UI",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = { "delve", "php-debug-adapter" },
		})

		vim.api.nvim_set_hl(0, "DapBreak", {
			fg = "#f38ba8",
		})
		vim.api.nvim_set_hl(0, "DapStop", {
			fg = "#f9e2af",
		})
		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		vim.fn.sign_define("DapBreakpointCondition", {
			text = "",
			texthl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "",
			texthl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		vim.fn.sign_define("DapLogPoint", {
			text = "",
			texthl = "DapLogPoint",
			numhl = "DapLogPoint",
		})
		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "DapStopped",
			numhl = "DapStopped",
		})

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
