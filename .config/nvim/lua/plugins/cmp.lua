return {
	"https://github.com/hrsh7th/nvim-cmp",
	dependencies = {
		{ "https://github.com/hrsh7th/cmp-buffer" },
		{ "https://github.com/hrsh7th/cmp-path" },
		{ "https://github.com/hrsh7th/cmp-nvim-lsp" },
		{ "https://github.com/hrsh7th/cmp-cmdline" },
	},
	config = function(_, opts)
		local cmp = require("cmp")
		cmp.setup({
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
