vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Zellij
vim.keymap.set("n", "<leader>tt", function()
	vim.fn.system("zellij action new-pane --floating")
end, { desc = "Floating Terminal" })

vim.keymap.set("n", "<leader>gg", function()
	vim.fn.system("zellij run --floating --close-on-exit --width '90%' --height '90%' -x '5%' -y '5%' -- lazygit")
end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader>tr", function()
	local cmd = vim.fn.input("Command: ")
	vim.fn.system("zellij run --direction down --close-on-exit -- " .. cmd)
end, { desc = "Run Command" })

vim.keymap.set("n", "<leader>tn", function()
	local name = vim.fn.input("Tab name: ")
	local cmd = "zellij action new-tab"
	if name ~= "" then
		cmd = cmd .. " --name " .. name
	end
	vim.fn.system(cmd)
end, { desc = "New Zellij Tab" })

vim.keymap.set("n", "<leader>tR", function()
	local name = vim.fn.input("Rename tab: ")
	if name ~= "" then
		vim.fn.system("zellij action rename-tab " .. name)
	end
end, { desc = "Rename Zellij Tab" })
