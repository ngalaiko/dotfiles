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

-- nvim-cmp source setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, value in pairs(servers) do
    value.capabilities = capabilities
    nvim_lsp[server].setup(value)
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
