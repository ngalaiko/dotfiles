luafile $HOME/.config/nvim/vimrc/plugins/nvim-lspconfig.lua

nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
" nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
" nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <space>q <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.format({async = true})<cr>
nnoremap <space>s <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <space>h <cmd>lua vim.lsp.buf.hover()<cr>
