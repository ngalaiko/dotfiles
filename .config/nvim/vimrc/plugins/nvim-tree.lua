-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	renderer = {
		group_empty = true,
		icons = {
			webdev_colors = false,
			show = {
				git = false,
				folder = false,
				file = true,
				folder_arrow = true,
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
