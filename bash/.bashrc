#
# ~/.bashrc
#

[[ $- != *i* ]] && return

#
# ALIASES
#
alias ls='ls -lhop --color=auto'
alias lst='ls -lht --color=auto'
alias grep='grep --color -n'
alias tree='tree -C -a -I .git'
alias lsvirtualenv='lsvirtualenv -b'
alias pdb='python -m pdb'
alias p='pwd'
alias dockimages='docker image ls --format='"'"'{{ print .ID " " .Repository " (" .Size ")"}}'"'"''
alias dockps='docker ps --format='"'"'{{ print .ID " " .Image " (" .Ports ")"}}'"'"''

shopt -s checkwinsize
stty -ixon

#
# SSH AUTH AGENT
#
# eval `keychain --eval --agents ssh id_rsa`

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
export VBCC=$HOME/w/amiga/c/vbcc
export NDK=$HOME/w/amiga/c/NDK_3.9
export NDK_INC=$NDK/Include/include_h
export NDK_LIB=$NDK/Include/linker_libs
export PATH="$HOME/w/amiga/c/vbcc/bin:$HOME/w/go/bin:$VBCC/bin:$HOME/.screenlayout:$HOME/bin:$HOME/.local/bin:$PATH"
export GOPATH=$HOME/w/go
export QT_QPA_PLATFORMTHEME=qt5ct


#
# BASH SOURCES
#
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/completions/git
source /usr/share/git/completion/git-prompt.sh

#
# COMPLETION
#
complete -cf sudo
complete -cf man

#
# COLORS
#
unset sq_color

#
# NPM
#
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
[ -e "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh
PATH="$HOME/.yarn/bin:$PATH"

#
# NVM
#
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
[ -e "/usr/share/nvm/nvm.sh" ] && source /usr/share/nvm/nvm.sh
[ -e "/usr/share/nvm/bash_completion" ] && source /usr/share/nvm/bash_completion
[ -e "/usr/share/nvm/install-nvm-exec" ] && source /usr/share/nvm/install-nvm-exec
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#
# RUBY GEM
#
#export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
#export GEM_HOME=$HOME/.gem

#
# rust
#
export PATH="$HOME/.cargo/bin:$PATH"

#
# Autorun
#
$HOME/bin/colors.sh

#
# PROMPT
#
source ~/.bash-powerline.sh
