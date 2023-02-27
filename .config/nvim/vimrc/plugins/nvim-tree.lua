require("nvim-tree").setup({
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
			webdev_colors = false,
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

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not directory and not no_name then
		return
	end

	if directory then
		-- change to the directory
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
