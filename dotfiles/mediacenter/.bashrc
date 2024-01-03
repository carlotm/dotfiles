[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend

alias ls="eza --long --header"
alias tree="eza --tree"
alias grep="rg -i"
alias find="fd"
alias d="devbox"
alias du="gdu"
alias cat="bat"

export EDITOR=vim

source /usr/share/bash-completion/bash_completion
NIX_PROFILE=/home/carloratm/.nix-profile/etc/profile.d/nix.sh
if [ -e $NIX_PROFILE ]; then source $NIX_PROFILE; fi
