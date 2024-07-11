return {
	"https://github.com/tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { noremap = true })
	end,
}
