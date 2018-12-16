#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -d ~/Desktop ]; then
	rm -rf ~/Desktop*
fi

rm -rf /opt/yogurt/*

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -merge .Xresources &
setxkbmap us &
/usr/bin/start-pulseaudio-x11 &
udiskie --automount &

xrandr | grep "DP-1 connected"
if [ $? -eq 0 ]; then
  bash $HOME/.screenlayout/dell.sh &
fi

WM=$(cat /tmp/.wmanager)
case $WM in
  dwm)
    conky | while read -r; do xsetroot -name "$REPLY"; done &
    exec ${HOME}/bin/startdwm
    ;;
  wmaker)
    exec wmaker
    ;;
esac

