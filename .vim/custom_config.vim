command! MakeTags !ctags -R .

" disable mouse
set mouse=
map <ScrollWheelUp> <Nop>
map <S-ScrollWhellUp> <Nop>
map <ScrollWheelDown> <Nop>
map <S-ScrollWheelDown> <Nop>

" set spell spelllang=en

let g:go_build_tags = 'unittests comptests functional'

syntax off

" tink packages.
let g:go_guru_scope = ['github.com/tink-ab']
