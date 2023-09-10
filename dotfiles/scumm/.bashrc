[[ $- != *i* ]] && return

alias ls="exa --long --header"
alias tree="exa --tree"
alias grep="rg -i"
alias find="fd"

export EDITOR=vim

source /usr/share/bash-completion/bash_completion

eval "$(starship init bash)"
