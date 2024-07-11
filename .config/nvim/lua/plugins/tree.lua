return {
	"https://github.com/kyazdani42/nvim-tree.lua",
	requires = {
		{
			"https://github.com/kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({
					default = true,
				})
			end,
		},
	},
	config = function()
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
		vim.keymap.set("n", "<leader>o", vim.cmd.NvimTreeToggle)
		vim.keymap.set("n", "<leader>O", vim.cmd.NvimTreeFindFile)

		-- disable highlighting
		vim.api.nvim_set_hl(0, "NvimTreeExecFile", { link = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { link = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeImageFile", { link = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeSymlink", { link = "NONE" })
	end,
}
