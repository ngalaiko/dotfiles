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
		"https://github.com/saghen/blink.cmp",
	},
	config = function()
		local nvim_lsp = require("lspconfig")

		-- register servers
		for server, value in pairs(servers) do
			value.capabilities = require("blink.cmp").get_lsp_capabilities(value.capabilities)
			nvim_lsp[server].setup(value)
		end
	end,
}
