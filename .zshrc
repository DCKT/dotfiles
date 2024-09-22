eval "$(starship init zsh)"
export ENV="local"
export NINJA_ANSI_FORCED=1
eval "$(fnm env --use-on-cd)"

# ALIAS
alias n=nvim
alias gph="git push origin head"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions thefuck ssh-agent)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

source $ZSH/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
