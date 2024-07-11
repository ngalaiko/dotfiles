return {
	"https://github.com/folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
		vim.api.nvim_set_keymap(
			"n",
			"<space>q",
			"<cmd>Trouble diagnostics toggle<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
