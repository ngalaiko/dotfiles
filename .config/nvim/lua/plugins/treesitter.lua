local languages = require("languages")
local ensure_installed = {}
for _, language in ipairs(languages) do
	table.insert(ensure_installed, language.ft[1])
end

return {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	opts = {
		ensure_installed = ensure_installed,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup(opts)
	end,
}
