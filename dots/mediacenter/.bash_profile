if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [[ -f ~/.bashrc ]] then
    . ~/.bashrc
fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
    then exec startx
fi
