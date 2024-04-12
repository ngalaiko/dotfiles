luafile $HOME/.config/nvim/vimrc/plugins/nvim-lspconfig.lua

" go to definition
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
" go to references
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
" go to implementation
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
" change definition
nnoremap cd <cmd>lua vim.lsp.buf.rename()<cr>
" nnoremap <space>q <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.format()<cr>
nnoremap <space>s <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <space>h <cmd>lua vim.lsp.buf.hover()<cr>
