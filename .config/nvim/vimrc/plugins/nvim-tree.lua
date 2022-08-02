require("nvim-tree").setup({
	open_on_setup = true,
	hijack_cursor = true,
	renderer = {
		group_empty = true,
		add_trailing = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			show = {
				git = false,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = {},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
