return {
	"https://github.com/tpope/vim-fugitive",
	dependencies = {
		"https://github.com/tpope/vim-rhubarb",
	},
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { noremap = true })
	end,
}
