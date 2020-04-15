# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load plugins via antigen 
source <(antibody init)
antibody bundle < "$HOME/.zsh_plugins.txt"


# load autocomplition
autoload -U compinit && compinit

# load aliases
source "$HOME/.aliases"

# cmd navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# https://github.com/zsh-users/zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="none"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="none"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
