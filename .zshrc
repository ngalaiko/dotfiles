source "$HOME/.config/zsh/zshrc"

# pnpm
export PNPM_HOME="/Users/nikita.galaiko/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
