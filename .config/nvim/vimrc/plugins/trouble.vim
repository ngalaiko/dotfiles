luafile $HOME/.config/nvim/vimrc/plugins/trouble.lua

nnoremap <space>q <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <space>Q <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap gr <cmd>TroubleToggle lsp_references<cr>
nnoremap gi <cmd>TroubleToggle lsp_implementations<cr>
