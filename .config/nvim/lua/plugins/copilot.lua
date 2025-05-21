return {
	"https://github.com/github/copilot.vim",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		vim.keymap.set("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
