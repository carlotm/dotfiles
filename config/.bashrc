#
# ~/.bashrc
#

[[ $- != *i* ]] && return

#
# ALIASES
#
alias ls='ls -lhop --color=auto'
alias grep='grep --color -n'
alias tree='tree -C -a -I .git'
alias vim='nvim'
alias trans="trans :it"
alias fd="NO_COLOR=1 fd"
diff() { command diff -u $* | diff-so-fancy; }

shopt -s checkwinsize
stty -ixon

#
# SSH AUTH AGENT
#
eval `keychain --eval --agents ssh id_rsa_t450s`

#
# ENVIRONMENT VARIABLES
#
export TERM=xterm-256color
export HISTCONTROL=ignoreboth
export EDITOR=nvim
export PIP_DOWNLOAD_CACHE="$HOME/.pip_download_cache"
export VST_PATH="$HOME/.vst"
export LV2_PATH="$HOME/.lv2:/usr/local/lib/lv2:/usr/lib/lv2"
export GIT_PS1_SHOWDIRTYSTATE=1
export ACKRC=".ackrc"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="$HOME/.screenlayout:$HOME/bin:$HOME/.local/bin:/sbin:/home/carloratm/.cache/rebar3/bin:$PATH:/opt/solr/bin"
export QT_QPA_PLATFORMTHEME=qt5ct
export SOUND_CARD_IRQ=49
export ELIXIR_EDITOR="echo vim +__LINE__ __FILE__"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export BAT_THEME="GitHub"
export FLYCTL_INSTALL="/home/carloratm/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
export ERL_FLAGS="-enable-feature all"
export KERL_BUILD_DOCS=yes

#
# COMPLETION
#
source /usr/share/bash-completion/bash_completion
complete -cf sudo
complete -cf man
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

#
# COLORS
#
unset sq_color

#
# NPM
#
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

#
# asdf
#
ASDF_DIR="$HOME/.asdf"
if [ -d "$ASDF_DIR" ]; then
  :
else
  echo "Installing asdf in $ASDF_DIR..."
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
fi
. $ASDF_DIR/asdf.sh
. $ASDF_DIR/completions/asdf.bash
# . ${HOME}/.asdf/plugins/java/set-java-home.bash

#
# PROMPT
#
eval "$(starship init bash)"
