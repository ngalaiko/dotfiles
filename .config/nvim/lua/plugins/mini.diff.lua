return {
	"https://github.com/echasnovski/mini.diff",
	dependencies = {
		"https://github.com/maladroitthief/jj-minidiff.nvim",
	},
	config = function()
		local M = require("mini.diff")

		M.setup({
			source = {
				M.gen_source.git(),
				require("jj-minidiff").setup({}),
			},
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
			},
		})
	end,
}
