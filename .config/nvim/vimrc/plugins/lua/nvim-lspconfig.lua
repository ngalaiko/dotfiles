local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	gopls = {
		cmd = { "gopls", "serve" },
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
	terraformls = {},
	html = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
	cssls = {},
	bashls = {},
	dockerls = {},
	vimls = {},
	clojure_lsp = {},
	volar = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
	tsserver = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
	svelte = {},
	pylsp = {},
}

-- prefix/character preceding the diagnostics' virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "▎", -- Could be '■', '●', 'x'
	},
})

-- replace the default lsp diagnostic letters with prettier symbols
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- nvim-cmp source setup
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
for server, value in pairs(servers) do
	value.capabilities = capabilities
end

-- change diagnostic signs
vim.cmd([[
  sign define DiagnosticSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text=  texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text=  texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]])

-- register servers
for server, value in pairs(servers) do
	nvim_lsp[server].setup(value)
end
