set completeopt=menu,menuone,noselect

luafile $HOME/.config/nvim/vimrc/plugins/lua/nvim-cmp.lua

" disable omli completion for sql
let g:omni_sql_default_compl_type = 'syntax'
