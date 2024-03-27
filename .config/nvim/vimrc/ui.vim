" Make sure that coursor is always vertically centered on j/k moves
set so=999

" add vertical lines on columns
" set colorcolumn=120

" Set command-line completion mode
set wildmode=list:longest,full

" Highlight current line - allows you to track cursor position more easily
set cursorline

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

" hide tabline
set showtabline=0

" wrap lines
set number 
set textwidth=0
set wrapmargin=0
set wrap
set linebreak 
set columns=148
