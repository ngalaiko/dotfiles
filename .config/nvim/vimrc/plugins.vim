call plug#begin('$HOME/.config/nvim/plugged')
    " colors
    Plug 'https://github.com/rktjmp/lush.nvim'
    Plug 'https://github.com/npxbr/gruvbox.nvim'
    Plug 'https://github.com/mcchrish/zenbones.nvim'
    " fancy status bar
    Plug 'https://github.com/nvim-lualine/lualine.nvim'
    " fancy icons
    Plug 'https://github.com/kyazdani42/nvim-web-devicons'
    " file tree for the vim ui
    Plug 'https://github.com/kyazdani42/nvim-tree.lua'
    " treesitter (better understand ast)
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'https://github.com/ngalaiko/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'https://github.com/nvim-treesitter/playground'
    " telescope (lua powered searching)
    Plug 'https://github.com/nvim-lua/popup.nvim'
    Plug 'https://github.com/nvim-lua/plenary.nvim'
    Plug 'https://github.com/nvim-telescope/telescope.nvim'
    " lua powered completion
    Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
    Plug 'https://github.com/hrsh7th/cmp-buffer'
    Plug 'https://github.com/hrsh7th/cmp-path'
    Plug 'https://github.com/hrsh7th/cmp-cmdline'
    Plug 'https://github.com/hrsh7th/cmp-omni'
    Plug 'https://github.com/hrsh7th/nvim-cmp'
    " snippets
    Plug 'https://github.com/hrsh7th/cmp-vsnip'
    Plug 'https://github.com/hrsh7th/vim-vsnip'
    " better understanding of paired symbols like parentheses, brackets, quotes, etc.
    Plug 'https://github.com/windwp/nvim-autopairs'
    " smart code commenting
    Plug 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'https://github.com/tpope/vim-commentary'
    " lsp integration for nvim
    Plug 'https://github.com/neovim/nvim-lspconfig'
    " integrations with git(hub)
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-rhubarb'
    Plug 'https://github.com/lewis6991/gitsigns.nvim'
    " linters, formatters
    Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'
    " nvim - kitty navigation
    Plug 'https://github.com/knubie/vim-kitty-navigator'
    " terraform
    Plug 'https://github.com/hashivim/vim-terraform'
    " tag viewer
    Plug 'https://github.com/simrat39/symbols-outline.nvim'
    " golang
    Plug 'https://github.com/fatih/vim-go'
    " github copilot
    Plug 'https://github.com/github/copilot.vim'
    " ledger
    Plug 'https://github.com/ledger/vim-ledger'
    " cooklang
    Plug 'https://github.com/luizribeiro/vim-cooklang', { 'for': 'cook' }
call plug#end()
