" enter the current millenium
set nocompatible

" let's make sure we are in noncompatble mode
set nocp

" Sets how many lines of history VIM has to remember
set history=700

" allow unsaved files
set hidden

" Enable filetype plugins
filetype plugin on
filetype indent on

let mapleader = ","
let g:mapleader = ","

" Reload config.
nnoremap <leader>sv :source $MYVIMRC<CR>

" Move lines around (macOS <A-j> = ˚ <A-k> = ∆)
nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m'>+<CR>gv=gv
vnoremap ˚ :m'<-2<CR>gv=gv

" disable mouse
set mouse=
map <ScrollWheelUp> <Nop>
map <S-ScrollWhellUp> <Nop>
map <ScrollWheelDown> <Nop>
map <S-ScrollWheelDown> <Nop>

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo

" Turn backup off
set nobackup
set nowb
set noswapfile

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages

nmap <Leader>p O<ESC>o<ESC>Ofmt.Printf("\nnikitag: %+v\n\n", )<ESC>i

" leave terminal mode with ease
tnoremap <Esc> <C-\><C-n>
