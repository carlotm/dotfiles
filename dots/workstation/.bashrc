[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend
tabs -4

alias ls="ls -lh --color=auto"
alias grep="rg -i"
alias find="fdfind --hidden"
alias tree="tree -C --dirsfirst"
alias d="devbox"
alias info="info --vi-keys"

export EDITOR=vim
export MANPAGER="less -R --use-color -Dd+y -Du+g"
export MANROFFOPT="-c"

source /usr/share/bash-completion/bash_completion

setxkbmap -layout us,it,de -option grp:win_space_toggle

eval "$(starship init bash)"
