local nvim_lsp = require'lspconfig'
local util = require'lspconfig/util'

nvim_lsp.gopls.setup{
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

nvim_lsp.terraformls.setup{}

nvim_lsp.html.setup{}

nvim_lsp.cssls.setup{}

nvim_lsp.bashls.setup{}

nvim_lsp.dockerls.setup{}

nvim_lsp.vimls.setup{}

nvim_lsp.java_language_server.setup{
    cmd = {"/Users/nikita.galaiko/code/java-language-server/dist/lang_server_mac.sh"},
    root_dir = function(fname)
        for _, patterns in ipairs({{'*.bazelproject'}, {'WORKSPACE'}}) do
            local root = util.root_pattern(unpack(patterns))(fname)
            if root then return root end
        end
        return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end
}
