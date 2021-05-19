let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
let g:completion_trigger_keyword_length = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" use treesitter for completion by default
let g:completion_chain_complete_list = {
    \'default' : [
    \    {'complete_items': ['lsp']},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \],
    \'comment': []
\}

autocmd BufEnter * lua require'completion'.on_attach()
