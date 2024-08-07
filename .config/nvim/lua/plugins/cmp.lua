return {
	"https://github.com/hrsh7th/nvim-cmp",
	dependencies = {
		{ "https://github.com/hrsh7th/cmp-buffer" },
		{ "https://github.com/hrsh7th/cmp-path" },
		{
			"https://github.com/hrsh7th/cmp-nvim-lsp",
			dependencies = {
				{
					"https://github.com/L3MON4D3/LuaSnip",
					dependencies = {
						"https://github.com/saadparwaiz1/cmp_luasnip",
						"https://github.com/rafamadriz/friendly-snippets",
					},
					keys = {
						{
							"<tab>",
							function()
								return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
							end,
							expr = true,
							silent = true,
							mode = "i",
						},
						{
							"<tab>",
							function()
								require("luasnip").jump(1)
							end,
							mode = "s",
						},
						{
							"<s-tab>",
							function()
								require("luasnip").jump(-1)
							end,
							mode = { "i", "s" },
						},
					},
				},
			},
		},
		{ "https://github.com/hrsh7th/cmp-cmdline" },
	},
	config = function(_, opts)
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = {
					i = cmp.mapping.select_next_item(),
				},
				["<UP>"] = {
					i = cmp.mapping.select_prev_item(),
				},
				["<DOWN>"] = {
					i = cmp.mapping.select_next_item(),
				},
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		-- autopairs setup
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
