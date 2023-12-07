[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s histappend

alias ls="ls -l --color"
#alias tree="eza --tree"
alias grep="rg -i"
#alias find="fd"
alias d="devbox"
alias du="gdu"
alias cat="batcat"

export EDITOR=vim

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
NIX_PROFILE=/home/carloratm/.nix-profile/etc/profile.d/nix.sh
if [ -e $NIX_PROFILE ]; then source $NIX_PROFILE; fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

eval "$(starship init bash)"
