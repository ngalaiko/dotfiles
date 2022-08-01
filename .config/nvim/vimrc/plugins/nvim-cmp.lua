local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
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
	formatting = {
		format = function(entry, vim_item)
			if entry.source.name == "copilot" then
				vim_item.kind = "[] Copilot"
				vim_item.kind_hl_group = "CmpItemKindCopilot"
				return vim_item
			end
			return lspkind.cmp_format({ with_text = false, maxwidth = 50 })(entry, vim_item)
		end,
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			require("copilot_cmp.comparators").score,

			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	sources = cmp.config.sources({
		{ name = "copilot", group_index = 2 },
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "nvim_lua", group_index = 2 },
		{ name = "vsnip", group_index = 2 },
		{ name = "omni", group_index = 2 },
		{ name = "buffer", group_index = 2 },
		{ name = "path", group_index = 2 },
	}),
})

-- autopairs setup
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
