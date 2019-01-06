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
unset sq_color

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
    local branch=$(__git_ps1)
    echo "» $branch"
}

function __virtualenv {
    local env=$(basename "$VIRTUAL_ENV")
    [ "$env" != "" ] && echo "» ${env}"
}

function __node {
    if hash node 2>/dev/null; then
        local v=$(node -v)
    fi
    [ "$v" != "" ] && echo "» ${v:1}"
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

PS1="\$(__info)\n\w $ "
