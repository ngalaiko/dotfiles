nnoremap <leader>o :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>O :NvimTreeFindFile<CR>

" disable highlighting
hi! link NvimTreeExecFile    NONE
hi! link NvimTreeSpecialFile NONE
hi! link NvimTreeSymlink     NONE
hi! link NvimTreeImageFile   NONE

luafile $HOME/.config/nvim/vimrc/plugins/nvim-tree.lua
