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
	},
	terraformls = {},
	solargraph = {},
	html = {},
	cssls = {},
	bashls = {},
	dockerls = {},
	vimls = {},
	clojure_lsp = {},
	volar = {
		filetypes = { "vue" },
	},
	tsserver = {},
	tailwindcss = {},
	svelte = {},
	pylsp = {},
	hls = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				assist = {
					importMergeBehavior = "last",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
					features = "all",
					buildScripts = {
						enable = false,
					},
				},
				check = {
					features = "all",
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
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
local capabilities = require("cmp_nvim_lsp").default_capabilities()
for server, value in pairs(servers) do
	value.capabilities = capabilities
	value.capabilities.textDocument.completion.completionItem.snippetSupport = false
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

-- enable inline hints
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client.server_capabilities.inlayHintProvider then
--             vim.lsp.inlay_hint.enable(args.buf, true)
--         end
--         -- whatever other lsp config you want
--     end
-- })
