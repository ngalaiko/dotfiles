#!/usr/bin/env bash

set -euo pipefail

ln -sf $(pwd)/.zshrc "$HOME/"
ln -sf $(pwd)/.aliases "$HOME/"
ln -sf $(pwd)/.zsh_plugins.txt "$HOME/"
ln -sf $(pwd)/.gitconfig "$HOME/"
ln -sf $(pwd)/.ssh/config "$HOME/.ssh/config"
ln -sf $(pwd)/.ssh/aws-ssm-ec2-proxy-command.sh "$HOME/.ssh/aws-ssm-ec2-proxy-command.sh"
ln -sf $(pwd)/.config/nvim "$HOME/.config/"
ln -sf $(pwd)/.config/kitty "$HOME/.config/"
ln -sf $(pwd)/.config/zsh "$HOME/.config/"

# gpg
mkdir -p "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"
ln -sf $(pwd)/.gnupg/dirmngr.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg-agent.conf "$HOME/.gnupg/"
ln -sf $(pwd)/.gnupg/gpg.conf "$HOME/.gnupg/"

brew bundle install
