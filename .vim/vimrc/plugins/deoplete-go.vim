call g:deoplete#custom#source('_', 'converters', [
    \ 'converter_remove_overlap',
    \ 'converter_truncate_abbr',
    \ 'converter_truncate_menu',
    \ 'converter_auto_paren',
    \ ])

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

