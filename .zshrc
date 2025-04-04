eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

source "~/.zshrc_alias"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions thefuck ssh-agent)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

# pnpm
export PNPM_HOME="/Users/thomasdeconinck/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/thomasdeconinck/.bun/_bun" ] && source "/Users/thomasdeconinck/.bun/_bun"
