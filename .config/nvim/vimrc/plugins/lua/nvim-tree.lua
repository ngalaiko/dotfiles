require("nvim-tree").setup({
	open_on_setup = true,
	hijack_cursor = true,
	view = {
		auto_resize = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = true,
			},
		},
	},
})
