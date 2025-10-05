return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luacheckrc", "stylua.toml", ".stylua.toml", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			completion = { callSnippet = "Replace" },
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
}
