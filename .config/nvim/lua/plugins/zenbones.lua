return {
	"https://github.com/zenbones-theme/zenbones.nvim",
	dependencies = { "https://github.com/rktjmp/lush.nvim" },
	config = function()
		vim.cmd.colorscheme("zenwritten")
		-- Enable syntax highlighting
		vim.cmd("syntax on")

		-- Set background to dark
		vim.o.background = "dark"

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
