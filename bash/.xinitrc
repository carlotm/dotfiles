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

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp+ /usr/share/fonts/bitmap
xset fp rehash
xrdb -merge .Xresources &
setxkbmap us &
xfce4-power-manager &
/usr/bin/start-pulseaudio-x11 &
udiskie --automount &
feh --bg-scale gfx/wallpapers/current &
xbindkeys &
"${HOME}/bin/bar.sh" &
exec "${HOME}/bin/startdwm"
