[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend

alias ls="ls -l --color=auto"
alias grep="rg -i"
alias find="fdfind --hidden"
alias tree="tree -C --dirsfirst"
alias d="devbox"

export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim
export MANPAGER="less -R --use-color -Dd+y -Du+g"
export MANROFFOPT="-P -c"

source /usr/share/bash-completion/bash_completion
