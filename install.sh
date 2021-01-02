#!/usr/bin/env bash

set -euo pipefail

ln -sf $(pwd)/.zshrc "$HOME/.zshrc"
ln -sf $(pwd)/.aliases "$HOME/.aliases"
ln -sf $(pwd)/.zsh_plugins.txt "$HOME/.zsh_plugins.txt"
ln -sf $(pwd)/.vimrc "$HOME/.vimrc"
ln -sf $(pwd)/.vim "$HOME/.vim"
ln -sf $(pwd)/.p10k.zsh "$HOME/.p10k.zsh"
ln -sf $(pwd)/.tmux.conf "$HOME/.tmux.conf"
ln -sf $(pwd)/.gitconfig "$HOME/.gitconfig"

brew bundle install
