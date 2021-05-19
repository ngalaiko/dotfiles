call plug#begin('$HOME/.vim/plugged')
	Plug 'https://github.com/dense-analysis/ale'
	Plug 'https://github.com/jiangmiao/auto-pairs'
	Plug 'https://github.com/nvim-lua/completion-nvim'
	Plug 'https://github.com/junegunn/fzf' , { 'do': { -> fzf#install() } }
	Plug 'https://github.com/junegunn/fzf.vim'
	Plug 'https://github.com/morhetz/gruvbox'
	Plug 'https://github.com/scrooloose/nerdcommenter'
	Plug 'https://github.com/scrooloose/nerdtree'
	Plug 'https://github.com/neovim/nvim-lspconfig'
	Plug 'https://github.com/majutsushi/tagbar'
	Plug 'https://github.com/vim-airline/vim-airline'
	Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/tpope/vim-rhubarb'
	Plug 'https://github.com/mhinz/vim-signify'
	Plug 'https://github.com/tpope/vim-surround'
	Plug 'https://github.com/hashivim/vim-terraform'
	Plug 'https://github.com/christoomey/vim-tmux-navigator'
	Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
	Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()
