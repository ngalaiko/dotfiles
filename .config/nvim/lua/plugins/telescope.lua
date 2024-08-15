return {
	"https://github.com/nvim-telescope/telescope.nvim",
	version = "0.1.8",
	opts = {
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" },
			},
		},
	},
	dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
	config = function(_, opts)
		require("telescope").setup(opts)
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-P>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
