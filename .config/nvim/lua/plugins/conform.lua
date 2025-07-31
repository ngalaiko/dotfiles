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
	config = true,
}
