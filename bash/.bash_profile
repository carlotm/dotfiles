# .bash_profile

[ -d $HOME/Desktop ] && rm -rf $HOME/Desktop
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
[ "$(tty)" = "/dev/tty1" ] && exec startx
