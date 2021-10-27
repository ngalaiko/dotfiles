nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

luafile $HOME/.config/nvim/vimrc/plugins/lua/telescope.lua

nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
