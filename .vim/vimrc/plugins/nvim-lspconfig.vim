lua <<EOF
    local nvim_lsp = require'nvim_lsp'
    local completion = require'completion'

    nvim_lsp.gopls.setup{
        on_attach=completion.on_attach
    }

    nvim_lsp.terraformls.setup{
        on_attach=completion.on_attach
    }

    nvim_lsp.html.setup{
        on_attach=completion.on_attach
    }

    nvim_lsp.cssls.setup{
        on_attach=completion.on_attach
    }

    nvim_lsp.bashls.setup{
        on_attach=completion.on_attach
    }

    nvim_lsp.dockerls.setup{
        on_attach=completion.on_attach
    }

    -- Disable Diagnostcs globally
    vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
EOF

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
