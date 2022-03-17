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
alias v='vim --cmd "let fullscreen=1"'
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
export EDITOR=vim
export PIP_DOWNLOAD_CACHE="$HOME/.pip_download_cache"
export VST_PATH="$HOME/.vst"
export LV2_PATH="$HOME/.lv2:/usr/local/lib/lv2:/usr/lib/lv2"
export GIT_PS1_SHOWDIRTYSTATE=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1
export ACKRC=".ackrc"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="$HOME/.screenlayout:$HOME/bin:$HOME/.local/bin:/sbin:/home/carloratm/.cache/rebar3/bin:$PATH"
export QT_QPA_PLATFORMTHEME=qt5ct
export SOUND_CARD_IRQ=49
export ELIXIR_EDITOR="echo vim +__LINE__ __FILE__"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

#
# COMPLETION
#
source /usr/share/bash-completion/bash_completion
complete -cf sudo
complete -cf man

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

#
# PROMPT
#
eval "$(starship init bash)"
