local languages = require("languages")
local packages = {}
for _, language in ipairs(languages) do
	for _, package in ipairs(language.packages or {}) do
		table.insert(packages, package)
	end
end

return {
	"https://github.com/williamboman/mason.nvim",
	config = function(_, opts)
		require("mason").setup(opts)

		local registry = require("mason-registry")
		local all_package_names = registry.get_all_package_names()
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
