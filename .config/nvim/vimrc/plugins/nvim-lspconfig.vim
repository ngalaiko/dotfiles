luafile $HOME/.config/nvim/vimrc/plugins/lua/nvim-lspconfig.lua

nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
" nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
" nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap d[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap d] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <space>s <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <space>h <cmd>lua vim.lsp.buf.hover()<cr>
