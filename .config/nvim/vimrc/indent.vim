set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Split tab vertically and horizontally
map <leader>v :vsp<cr>
map <leader>s :sp<cr>

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Don't Wrap lines (it is stupid)
