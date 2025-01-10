#!/usr/bin/env bash

set -euo pipefail

ln -sf $(pwd)/.zshrc "$HOME/"
ln -sf $(pwd)/.aliases "$HOME/"
ln -sf $(pwd)/.zsh_plugins.txt "$HOME/"
ln -sf $(pwd)/.hushlogin "$HOME/"
ln -sf $(pwd)/.aerospace.toml "$HOME/"
ln -sf $(pwd)/.config/nvim "$HOME/.config/"
ln -sf $(pwd)/.config/zsh "$HOME/.config/"
ln -sf $(pwd)/.config/git "$HOME/.config/"
ln -sf $(pwd)/.config/wezterm "$HOME/.config/"
ln -sf $(pwd)/.config/starship.toml "$HOME/.config/starship.toml"
ln -sf $(pwd)/.config/ghostty "$HOME/.config/"
ln -sf $(pwd)/.config/zed "$HOME/.config/"
ln -sf $(pwd)/.config/helix "$HOME/.config/helix"

# gpg
mkdir -p "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"
ln -sf $(pwd)/.gnupg/dirmngr.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg-agent.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg.conf "$HOME/.gnupg/"

brew bundle install
