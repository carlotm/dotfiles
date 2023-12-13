#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
xsetroot -solid "#143971" &
xrdb ~/.Xresources &
xfce4-power-manager &
setxkbmap -layout us,it,de -option grp:win_space_toggle &
dbus-run-session icewm
