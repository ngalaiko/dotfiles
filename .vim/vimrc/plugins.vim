call plug#begin('$HOME/.vim/plugged')
    " colors
    Plug 'https://github.com/rktjmp/lush.nvim'
    Plug 'https://github.com/npxbr/gruvbox.nvim'
    " file tree for the vim ui
    Plug 'https://github.com/scrooloose/nerdtree'
    " fancy status bar
    Plug 'https://github.com/vim-airline/vim-airline'
    " treesitter (better understand ast)
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
    " telescope (lua powered searching)
    Plug 'https://github.com/nvim-lua/popup.nvim'
    Plug 'https://github.com/nvim-lua/plenary.nvim'
    Plug 'https://github.com/nvim-telescope/telescope.nvim'
    " lua powered completion
    Plug 'https://github.com/nvim-lua/completion-nvim'
    " better understanding of paired symbols like parentheses, brackets, quotes, etc.
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/tpope/vim-surround'
    " smart code commenting
    Plug 'https://github.com/scrooloose/nerdcommenter'
    " lsp integration for nvim
    Plug 'https://github.com/neovim/nvim-lspconfig'
    " integrations with git(hub)
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-rhubarb'
    Plug 'https://github.com/mhinz/vim-signify'
    " use same keys to move between vim/tmux panels
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
call plug#end()