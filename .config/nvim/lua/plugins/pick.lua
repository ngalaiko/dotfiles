return {
	"https://github.com/echasnovski/mini.pick",
	config = function()
		require("mini.pick").setup()
		vim.keymap.set("n", "<C-P>", ":Pick files<CR>")
		vim.keymap.set("n", "<leader>ps", ":Pick grep<CR>")
	end,
}
