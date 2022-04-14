require("nvim-tree").setup({
	open_on_setup = true,
	hijack_cursor = true,
	view = {
		auto_resize = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
