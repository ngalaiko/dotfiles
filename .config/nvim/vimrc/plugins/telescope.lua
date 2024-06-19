local telescope = require("telescope")
local trouble = require("trouble.sources.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open },
			n = { ["<c-t>"] = trouble.open },
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "vertical",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				width = 0.8,
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {
			"node_modules",
			"dist",
			"__generated__",
		},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})
