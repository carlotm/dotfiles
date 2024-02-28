[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend

alias ls="eza --long --header"
alias tree="eza --tree"
alias grep="rg -i"
alias find="fd --hidden"
alias d="devbox"
alias du="gdu"
alias cat="bat"
alias vagrant="vagrant --provider=libvirt"

export EDITOR=vim
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

source /usr/share/bash-completion/bash_completion
NIX_PROFILE=/home/carloratm/.nix-profile/etc/profile.d/nix.sh
if [ -e $NIX_PROFILE ]; then source $NIX_PROFILE; fi

ASDF=/opt/asdf-vm/asdf.sh
if [ -e $ASDF ]; then . $ASDF; fi

eval "$(starship init bash)"
