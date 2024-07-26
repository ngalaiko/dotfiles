local languages = require("languages")
local ensure_installed = {}
for _, language in ipairs(languages) do
	for _, ft in ipairs(language.ft) do
		table.insert(ensure_installed, ft)
	end
end

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
