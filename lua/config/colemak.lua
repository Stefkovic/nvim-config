-- check if using "Unicode Hex Input" keyboard layout
local function is_unicode_layout()
	local handle = io.popen("defaults read com.apple.HIToolbox AppleSelectedInputSources | grep 'Unicode Hex Input'")
	if not handle then
		return false
	end
	local result = handle:read("*a")
	handle:close()
	return result ~= ""
end

-- apply Colemak-DH mappings
local function enable_colemak()
	-- Navigation keys
	vim.keymap.set({ "n", "v" }, "n", "j", {
		desc = "Down (Colemak-DH)",
	})
	vim.keymap.set({ "n", "v" }, "e", "k", {
		desc = "Up (Colemak-DH)",
	})
	vim.keymap.set({ "n", "v" }, "i", "l", {
		desc = "Right (Colemak-DH)",
	})
	vim.keymap.set({ "n", "v" }, "m", "h", {
		desc = "Left (Colemak-DH)",
	})

	-- Displaced commands
	vim.keymap.set({ "n", "v" }, "j", "e", {
		desc = "End of word",
	})
	vim.keymap.set({ "n", "v" }, "k", "n", {
		desc = "Next match",
	})
	vim.keymap.set("n", "l", "i", {
		desc = "Insert mode",
	})
	vim.keymap.set({ "n", "v" }, "h", "m", {
		desc = "Mark",
	})

	-- Additional remappings
	vim.keymap.set({ "n", "v" }, "K", "N", {
		desc = "Previous match",
	})
	vim.keymap.set("n", "L", "I", {
		desc = "Insert at line start",
	})
	vim.keymap.set("n", "H", "M", {
		desc = "Middle of screen",
	})

	vim.notify("Colemak-DH mappings active", vim.log.levels.INFO)
end

-- Check for Unicode layout on startup
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		if is_unicode_layout() == true then
			enable_colemak()
		end
	end,
})

vim.api.nvim_create_user_command("ColemakLayout", enable_colemak, {})
