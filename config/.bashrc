# ~/.bashrc
[[ $- != *i* ]] && return

# ALIASES
alias ls='exa --long --header'
alias tree='exa --tree'
alias grep='rg'
alias find="fd"

# OPTIONS
unset sq_color
shopt -s checkwinsize
stty -ixon

# SSH AUTH AGENT
eval `keychain --eval --agents ssh id_rsa_t450s`

# ENVIRONMENT VARIABLES
export TERM=xterm-256color
export HISTCONTROL=ignoreboth
export EDITOR=vim
export PATH="$HOME/.screenlayout:$HOME/bin:$HOME/.local/bin:/sbin:/home/carloratm/.cache/rebar3/bin:$PATH:/opt/solr/bin"
export ERL_AFLAGS="-kernel shell_history enabled"
export ERL_FLAGS="-enable-feature all"
export KERL_BUILD_DOCS=yes

# COMPLETIONS
source /usr/share/bash-completion/bash_completion
complete -cf sudo
complete -cf man

# NPM
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# PROMPT
eval "$(starship init bash)"
