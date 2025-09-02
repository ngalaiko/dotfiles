return {
	"https://github.com/saghen/blink.cmp",
	version = "1.*",
	opts = {
		sources = {
			default = { "lsp", "path", "buffer" },
		},
		completion = {
			ghost_text = { enabled = true },
		},
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "default",
			["<Enter>"] = { "select_and_accept" },
		},
	},
	config = true,
}
