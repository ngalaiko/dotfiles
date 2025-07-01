return {
	"https://github.com/hedyhli/outline.nvim",
	config = function()
		require("outline").setup({})
		vim.keymap.set("n", "<leader>tt", "<cmd>Outline<CR>", { noremap = true })
	end,
}
