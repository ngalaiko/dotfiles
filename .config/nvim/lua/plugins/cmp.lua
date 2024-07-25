return {
	"https://github.com/hrsh7th/nvim-cmp",
	depencencies = {
		"https://github.com/hrsh7th/cmp-nvim-lsp",
		"https://github.com/hrsh7th/cmp-buffer",
		"https://github.com/hrsh7th/cmp-path",
		"https://github.com/hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
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
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "conjure" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		-- autopairs setup
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		-- Disable omni completion for SQL
		vim.g.omni_sql_default_compl_type = "syntax"
	end,
}
