call plug#begin('$HOME/.vim/plugged')
    " colors
    Plug 'https://github.com/rktjmp/lush.nvim'
    Plug 'https://github.com/npxbr/gruvbox.nvim'

    " treesitter
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
    
    " telescope
    Plug 'https://github.com/nvim-lua/popup.nvim'
    Plug 'https://github.com/nvim-lua/plenary.nvim'
    Plug 'https://github.com/nvim-telescope/telescope.nvim'

    " lua powered completion
    Plug 'https://github.com/nvim-lua/completion-nvim'

    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/neovim/nvim-lspconfig'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-rhubarb'
    Plug 'https://github.com/mhinz/vim-signify'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
call plug#end()
