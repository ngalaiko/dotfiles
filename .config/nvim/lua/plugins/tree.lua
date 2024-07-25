return {
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"https://github.com/nvim-lua/plenary.nvim",
		{
			"https://github.com/nvim-tree/nvim-web-devicons",
			opts = {
				color_icons = false,
			},
			config = function(_, opts)
				require("nvim-web-devicons").setup(opts)
			end,
		},
		"https://github.com/MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		enable_git_status = false,
		enable_diagnostics = false,
		open_files_do_not_replace_types = { "trouble" },
		default_component_configs = {
			indent = {
				highlight = "",
				expander_highlight = "",
			},
			icon = {
				highlight = "",
			},
			modified = {
				highlight = "",
			},
			name = {
				highlight = "",
			},
		},
		nesting_rules = {},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			group_empty_dirs = true,
			use_libuv_file_watcher = true,
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
