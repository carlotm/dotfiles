#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export XDG_CONFIG_HOME=$HOME/.config
xrandr
xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 48
xrdb -merge ~/.Xresources
setxkbmap -layout us,it,de -option grp:win_space_toggle
xfce4-power-manager &
xbindkeys &
xsetroot -solid "#000000"
exec dbus-launch xmonad
