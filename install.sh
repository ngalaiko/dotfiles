#!/usr/bin/env bash

set -euo pipefail

ln -sf $(pwd)/.hushlogin "$HOME/"
ln -sf $(pwd)/.config/nvim "$HOME/.config/"
ln -sf $(pwd)/.config/git "$HOME/.config/"
ln -sf $(pwd)/.config/ghostty "$HOME/.config/"
ln -sf $(pwd)/.config/zed "$HOME/.config/"
ln -sf $(pwd)/.config/helix "$HOME/.config/helix"
ln -sf $(pwd)/.config/fish "$HOME/.config/fish"
ln -sf $(pwd)/.config/atuin "$HOME/.config/atuin"
ln -sf $(pwd)/.config/homebrew "$HOME/.config/homebrew"
ln -sf $(pwd)/.config/jj "$HOME/.config/jj"

# gpg
mkdir -p "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"
ln -sf $(pwd)/.gnupg/dirmngr.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg-agent.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg.conf "$HOME/.gnupg/"

brew bundle install
