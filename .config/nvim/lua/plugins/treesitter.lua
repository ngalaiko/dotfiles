local languages = {
	"bash",
	"go",
	"gomod",
	"html",
	"java",
	"javascript",
	"svelte",
	"json",
	"lua",
	"yaml",
	"clojure",
	"rust",
	"vue",
	"graphql",
	"css",
}

return {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	opts = {
		ensure_installed = languages,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup(opts)
	end,
}
