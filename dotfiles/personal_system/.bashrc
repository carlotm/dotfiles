[[ $- != *i* ]] && return

alias ls="eza --long --header"
alias tree="eza --tree"
alias grep="rg -i"
alias find="fd"
alias d="devbox"
alias du="gdu"

export EDITOR=vim

source /usr/share/bash-completion/bash_completion
NIX_PROFILE=/home/carloratm/.nix-profile/etc/profile.d/nix.sh
if [ -e $NIX_PROFILE ]; then source $NIX_PROFILE; fi

eval "$(starship init bash)"
