#!/usr/bin/env bash

set -euo pipefail

ln -sf $(pwd)/.zshrc "$HOME/"
ln -sf $(pwd)/.aliases "$HOME/"
ln -sf $(pwd)/.zsh_plugins.txt "$HOME/"
ln -sf $(pwd)/.gitconfig "$HOME/"
ln -sf $(pwd)/.hledger.journal "$HOME/"
ln -sf $(pwd)/.config/nvim "$HOME/.config/"
ln -sf $(pwd)/.config/kitty "$HOME/.config/"
ln -sf $(pwd)/.config/zsh "$HOME/.config/"
ln -sf $(pwd)/.config/starship.toml "$HOME/.config/"

brew bundle install
