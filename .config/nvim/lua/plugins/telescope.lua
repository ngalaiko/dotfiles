return {
	"https://github.com/nvim-telescope/telescope.nvim",
	version = "0.1.8",
	dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-F>", builtin.find_files, {})
		vim.keymap.set("n", "<C-P>", builtin.git_files, {})
		vim.keymap.set("n", "<C-S>", builtin.grep_string, {})
	end,
}
