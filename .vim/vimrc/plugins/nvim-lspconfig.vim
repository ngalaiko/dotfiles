luafile $HOME/.vim/vimrc/plugins/lua/lspconfig.lua

nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<cr>
