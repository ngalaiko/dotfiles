return {
	"https://github.com/saghen/blink.cmp",
	version = "1.*",
	opts = {
		sources = {
			default = { "lsp", "path", "buffer" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
		},
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
	},
	config = true,
}
