export LANG="en_US.UTF-8"

# gpg suite
export GPG_TTY=$(tty)

# homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/opt:$PATH"

# golang stuff
GOPATH="$HOME/go"
GOBIN="$GOPATH/bin"
PATH="$PATH:$GOBIN"

# load plugins via antigen
source <(antibody init)
antibody bundle < "$HOME/.zsh_plugins.txt"

# load autocomplition
autoload -U compinit && compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# kubectl completion
[[ -z $(command -v kubectl) ]] || source <(kubectl completion zsh)

# load aliases
source "$HOME/.aliases"

# option navigation
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# https://github.com/zsh-users/zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="none"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="none"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Enable starship prompt. Keep at the end.
eval "$(starship init zsh)"
