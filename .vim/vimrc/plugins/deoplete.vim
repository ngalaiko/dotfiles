" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<Down>" : "\<tab>"
