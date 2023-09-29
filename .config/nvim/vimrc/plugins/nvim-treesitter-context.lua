require("treesitter-context").setup({
	enable = true,
	mode = "topline",
	multiline_threshold = 1,
	trim_scope = "outer",
})
