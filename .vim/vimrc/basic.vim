"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------"
" enter the current millenium
set nocompatible

" let's make sure we are in noncompatble mode
set nocp

" Sets how many lines of history VIM has to remember
set history=700

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

nmap <Leader>p O<ESC>o<ESC>Ofmt.Printf("\nnikitag: %+v\n\n", )<ESC>i

"------------------------------------------------------------------------------
" VIM user interface
"------------------------------------------------------------------------------

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" add vertical lines on columns
set colorcolumn=114

" Set command-line completion mode
set wildmode=list:longest,full

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

set path+=**

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" line number + relative numbers
set relativenumber number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Allow smarter completion by infering the case
set infercase

" Ignore case when searching
set ignorecase

" Double ESC to unhilight your search
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha


"------------------------------------------------------------------------------
" Colors and Fonts
"------------------------------------------------------------------------------

" Enable syntax highlighting
syntax on
set termguicolors

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set spelllang=en_us spell
"set spell

"------------------------------------------------------------------------------
" Files, backups and undo
"------------------------------------------------------------------------------

" Turn backup off
set nobackup
set nowb
set noswapfile

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo

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


"------------------------------------------------------------------------------
" Text, tab and indent related
"------------------------------------------------------------------------------

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

"------------------------------------------------------------------------------
" Visual mode related
"------------------------------------------------------------------------------

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"------------------------------------------------------------------------------
" Moving around, tabs, windows and buffers
"------------------------------------------------------------------------------

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%
