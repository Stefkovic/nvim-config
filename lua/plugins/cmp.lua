return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"windwp/nvim-autopairs",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("nvim-autopairs").setup()
		require("lazydev").setup({
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})

		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{
					name = "nvim_lsp",
				},
				{
					name = "luasnip",
				},
				{
					name = "path",
				},
				{
					name = "nvim_lsp_signature_help",
				},
			},
		})
	end,
}
