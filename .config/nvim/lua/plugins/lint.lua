local languages = require("languages")
local linters_by_ft = {}
for _, language in ipairs(languages) do
	for _, ft in ipairs(language.ft) do
		linters_by_ft[ft] = language.linters or {}
	end
end

return {
	"https://github.com/mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = linters_by_ft
	end,
}
