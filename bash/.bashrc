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
alias feh='feh --scale-down'

shopt -s checkwinsize
stty -ixon

#
# SSH AUTH AGENT
#
eval `keychain --eval --agents ssh id_rsa`

#
# ENVIRONMENT VARIABLES
#
HISTCONTROL=ignoreboth
EDITOR=vim
TERM=xterm-256color
QT_STYLE_OVERRIDE=gtk
export TERM
export HISTCONTROL
export EDITOR
export PIP_DOWNLOAD_CACHE="$HOME/.pip_download_cache"
export QT_STYLE_OVERRIDE
export VST_PATH="$HOME/.vst"
export LV2_PATH="$HOME/.lv2:/usr/local/lib/lv2:/usr/lib/lv2"
export GIT_PS1_SHOWDIRTYSTATE=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1
export ACKRC=".ackrc"
export PATH="$HOME/.screenlayout:$HOME/bin:$HOME/.local/bin:$PATH"
export VIRTUAL_ENV_DISABLE_PROMPT=1


#
# SOURCES
#
source /usr/share/git/completion/git-completion.bash
source /usr/share/bash-completion/completions/git
source /usr/share/git/completion/git-prompt.sh
source $HOME/.git-prompt.sh

#
# COMPLETION
#
complete -cf sudo
complete -cf man

#
# COLORS
#
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

#
# PROMPT
#
PS1='\[\e[94m\]\w$(__git_ps1 "\[\e[32m\] %s\[\e[0m\]")\[\e[0m\]$ '
unset sq_color
export PS1

#
# VIRTUALENVWRAPPER
#
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh

#
# NPM
#
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
source /usr/share/nvm/init-nvm.sh

#
# NVM
#
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

#
# RUBY GEM
#
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

#
# rust
#
export PATH="$HOME/.cargo/bin:$PATH"


#
# prompt
#

function __git_branch {
  __git_ps1 "» $IPurple%s$Color_Off"
}

function __virtualenv {
  local env=$(basename "$VIRTUAL_ENV")
  [ "$env" != "" ] && echo -e "» $IGreen${env}$Color_Off"
}

function __node {
  if hash node 2>/dev/null; then
    local v=$(node -v)
  fi
  [ "$v" != "" ] && echo -e "» $IYellow${v:1}$Color_Off"
}

function __info {
  local full=(
    $(__virtualenv)
    $(__node)
    $(__git_branch)
  )
  full="${full[*]}"
  [ "$full" != "" ] && echo "$full"
}

PS1="\$(__info)\n$ICyan\w$Color_Off $ "
