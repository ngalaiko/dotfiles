local languages = require("languages")
local ensure_installed = {}
for _, language in ipairs(languages) do
	table.insert(ensure_installed, language.ft[1])
end

return {
	{
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
	},
	{
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]a"] = "@parameter.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[a"] = "@parameter.outer",
						},
					},
				},
			})
		end,
	},
}
