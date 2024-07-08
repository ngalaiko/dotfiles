call plug#begin('$HOME/.config/nvim/plugged')
    " colors
    Plug 'https://github.com/rktjmp/lush.nvim'
    Plug 'https://github.com/mcchrish/zenbones.nvim'
    " fancy status bar
    Plug 'https://github.com/nvim-lualine/lualine.nvim'
    " fancy icons
    Plug 'https://github.com/kyazdani42/nvim-web-devicons'
    " file tree for the vim ui
    Plug 'https://github.com/kyazdani42/nvim-tree.lua'
    " treesitter (better understand ast)
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'https://github.com/nvim-treesitter/nvim-treesitter-context'
    " telescope (lua powered searching)
    Plug 'https://github.com/nvim-lua/popup.nvim'
    Plug 'https://github.com/nvim-lua/plenary.nvim'
    Plug 'https://github.com/nvim-telescope/telescope.nvim'
    " lua powered completion
    Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
    Plug 'https://github.com/hrsh7th/cmp-buffer'
    Plug 'https://github.com/hrsh7th/cmp-path'
    Plug 'https://github.com/hrsh7th/cmp-cmdline'
    Plug 'https://github.com/hrsh7th/nvim-cmp'
    " menu to show diagnostic issues and stuff like that
    Plug 'https://github.com/folke/trouble.nvim'
    " better understanding of paired symbols like parentheses, brackets, quotes, etc.
    Plug 'https://github.com/windwp/nvim-autopairs'
    " smart code commenting
    Plug 'https://github.com/numToStr/Comment.nvim'
    " lsp integration for nvim
    Plug 'https://github.com/neovim/nvim-lspconfig'
    " integrations with git(hub)
    Plug 'https://github.com/lewis6991/gitsigns.nvim'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-rhubarb'
    " linters, formatters
    Plug 'https://github.com/stevearc/conform.nvim'
    " nvim - multiplexer navigation
    Plug 'https://github.com/numToStr/Navigator.nvim'
    " tag viewer
    Plug 'https://github.com/simrat39/symbols-outline.nvim'
    " ledger
    Plug 'https://github.com/ledger/vim-ledger'
call plug#end()
