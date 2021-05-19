source $HOME/.vim/vimrc/basic.vim

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
    Plug 'https://github.com/fatih/vim-go'
    Plug 'https://github.com/tpope/vim-rhubarb'
    Plug 'https://github.com/mhinz/vim-signify'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/hashivim/vim-terraform'
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
call plug#end()

" Load plugins settings
source $HOME/.vim/vimrc/plugins/ale.vim
source $HOME/.vim/vimrc/plugins/completion-nvim.vim
source $HOME/.vim/vimrc/plugins/fzf.vim
source $HOME/.vim/vimrc/plugins/fzf.vim
source $HOME/.vim/vimrc/plugins/gruvbox.vim
source $HOME/.vim/vimrc/plugins/nerdtree.vim
source $HOME/.vim/vimrc/plugins/nvim-lspconfig.vim
source $HOME/.vim/vimrc/plugins/tagbar.vim
source $HOME/.vim/vimrc/plugins/vim-airline.vim
source $HOME/.vim/vimrc/plugins/vim-go.vim
source $HOME/.vim/vimrc/plugins/vim-terraform.vim
