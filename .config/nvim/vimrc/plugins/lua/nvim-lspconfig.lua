local nvim_lsp = require'lspconfig'
local util = require'lspconfig/util'

local servers = {
    gopls = {
        cmd = {"gopls", "serve"},
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
    html = {},
    cssls = {},
    bashls = {},
    dockerls = {},
    vimls = {},
    clojure_lsp = {},
    vuels = {},
    tsserver = {},
    svelte = {},
}

-- prefix/character preceding the diagnostics' virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  }
})

-- replace the default lsp diagnostic letters with prettier symbols
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- nvim-cmp source setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, value in pairs(servers) do
    value.capabilities = capabilities
    nvim_lsp[server].setup(value)
end

-- change diagnostic signs
vim.cmd [[
  sign define DiagnosticSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text=  texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text=  texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]]
