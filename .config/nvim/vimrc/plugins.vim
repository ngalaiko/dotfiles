call plug#begin('$HOME/.config/nvim/plugged')
    " colors
    Plug 'https://github.com/rktjmp/lush.nvim'
    Plug 'https://github.com/npxbr/gruvbox.nvim'
    " fancy status bar
    Plug 'https://github.com/glepnir/galaxyline.nvim' , {'branch': 'main'}
    " fancy icons
    Plug 'https://github.com/kyazdani42/nvim-web-devicons'
    " file tree for the vim ui
    Plug 'https://github.com/kyazdani42/nvim-tree.lua'
    " icons for lsp hints
    Plug 'https://github.com/onsails/lspkind-nvim'
    " treesitter (better understand ast)
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
    " telescope (lua powered searching)
    Plug 'https://github.com/nvim-lua/popup.nvim'
    Plug 'https://github.com/nvim-lua/plenary.nvim'
    Plug 'https://github.com/nvim-telescope/telescope.nvim'
    " lua powered completion
    Plug 'https://github.com/hrsh7th/nvim-compe'
    " better understanding of paired symbols like parentheses, brackets, quotes, etc.
    Plug 'https://github.com/windwp/nvim-autopairs'
    Plug 'https://github.com/tpope/vim-surround'
    " smart code commenting
    Plug 'https://github.com/scrooloose/nerdcommenter'
    " lsp integration for nvim
    Plug 'https://github.com/neovim/nvim-lspconfig'
    " integrations with git(hub)
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-rhubarb'
    Plug 'https://github.com/lewis6991/gitsigns.nvim'
    " use same keys to move between vim/tmux panels
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    " bazel integration
    Plug 'https://github.com/google/vim-maktaba'
    Plug 'https://github.com/bazelbuild/vim-bazel'
    " linters
    Plug 'https://github.com/dense-analysis/ale'
call plug#end()
