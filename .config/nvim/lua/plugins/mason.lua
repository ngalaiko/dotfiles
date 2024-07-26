local languages = require("languages")
local packages = {}
for _, language in ipairs(languages) do
	for _, linter in ipairs(language.linters or {}) do
		table.insert(packages, linter)
	end
	for _, formatter in ipairs(language.formatters or {}) do
		table.insert(packages, formatter)
	end
	for lsp in pairs(language.lsp or {}) do
		table.insert(packages, lsp)
	end
end

return {
	"https://github.com/williamboman/mason.nvim",
	config = function(_, opts)
		require("mason").setup(opts)

		local registry = require("mason-registry")
		registry.refresh(function()
			for _, pkg_name in ipairs(packages) do
				local pkg = registry.get_package(pkg_name)
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end)
	end,
}
