return {
	"https://github.com/simrat39/symbols-outline.nvim",
	config = function()
		require("symbols-outline").setup({
			highlight_hovered_item = false,
			show_guides = false,
			width = 50,
			keymaps = {},
		})
		vim.keymap.set("n", "<leader>tt", vim.cmd.SymbolsOutline, { noremap = true })
	end,
}
