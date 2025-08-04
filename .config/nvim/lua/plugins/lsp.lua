local languages = require("languages")
local servers = {}
for _, language in ipairs(languages) do
	local lsp = language.lsp
	if lsp then
		for name, opts in pairs(lsp) do
			servers[name] = opts
		end
	end
end

return {
	"https://github.com/neovim/nvim-lspconfig",
	dependencies = {
		{
			"https://github.com/hrsh7th/cmp-nvim-lsp",
		},
	},
	config = function()
		local nvim_lsp = require("lspconfig")

		-- nvim-cmp source setup
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		for _, value in pairs(servers) do
			value.capabilities = capabilities
			value.capabilities.textDocument.completion.completionItem.snippetSupport = false
		end

		-- register servers
		for server, value in pairs(servers) do
			nvim_lsp[server].setup(value)
		end
	end,
}
