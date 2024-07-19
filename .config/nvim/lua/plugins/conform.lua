local languages = require("languages")
local formatters_by_ft = {}
for _, language in ipairs(languages) do
	for _, ft in ipairs(language.ft) do
		formatters_by_ft[ft] = language.formatters or {}
	end
end

return {
	"https://github.com/stevearc/conform.nvim",
	opts = {
		formatters_by_ft = formatters_by_ft,
	},
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)

		vim.keymap.set("n", "<space>f", function()
			conform.format()
		end, { noremap = true })
	end,
}
