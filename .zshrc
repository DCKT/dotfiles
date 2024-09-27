eval "$(starship init zsh)"
export ENV="local"
export NINJA_ANSI_FORCED=1
eval "$(fnm env --use-on-cd)"

export PROJECTS="$HOME/Projects"

# ALIAS
alias n=nvim
alias vim=nvim
alias gph="git push origin head"
alias toolkit="cd $PROJECTS/front/rescript-toolkit/"
alias api="cd $PROJECTS/front/api"
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions thefuck ssh-agent)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

