[[ $- != *i* ]] && return

alias ls="eza --long --header"
alias tree="eza --tree"
alias grep="rg -i"
alias find="fd"

export EDITOR=vim

source /usr/share/bash-completion/bash_completion

eval "$(starship init bash)"
eval "$(direnv hook bash)"
