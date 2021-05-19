lua <<EOF
    local nvim_lsp = require'lspconfig'
    local completion = require'completion'
    local util = require 'lspconfig/util'

    nvim_lsp.gopls.setup{
        on_attach=completion.on_attach,
        cmd = {"gopls", "serve"},
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        },
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

    nvim_lsp.java_language_server.setup{
        on_attach=completion.on_attach,
        cmd = {"/Users/nikita.galaiko.code/java-language-server/dist/lang_server_mac.sh"},
        filetypes = {'java'},
        root_dir = function(fname)
            for _, patterns in ipairs({{'*.bazelproject'}}) do
                local root = util.root_pattern(unpack(patterns))(fname)
                if root then return root end
            end
            return vim.fn.getcwd()
        end
    }

    -- Disable Diagnostcs globally
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

    function goimports(timeoutms)
        local context = { source = { organizeImports = true } }
        vim.validate { context = { context, "t", true } }

        local params = vim.lsp.util.make_range_params()
        params.context = context

        local method = "textDocument/codeAction"
        local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
        if resp and resp[1] then
            local result = resp[1].result
            if result and result[1] then
                local edit = result[1].edit
                vim.lsp.util.apply_workspace_edit(edit)
            end
        end

        vim.lsp.buf.formatting()
    end
EOF

"autocmd BufWritePre *.go lua goimports(1000)

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
