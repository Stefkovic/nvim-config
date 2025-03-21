return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "windwp/nvim-ts-autotag" },
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"csv",
			"comment",
			"dart",
			"devicetree",
			"diff",
			"dockerfile",
			"gitignore",
			"go",
			"gowork",
			"gomod",
			"gosum",
			"gotmpl",
			"html",
			"javascript",
			"json",
			"kotlin",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"php",
			"query",
			"regex",
			"ruby",
			"svelte",
			"swift",
			"sql",
			"templ",
			"terraform",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = {
			enable = true,
			disable = { "ruby" },
		},
		autotag = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
