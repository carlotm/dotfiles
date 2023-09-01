#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
xrdb ~/.Xresources
#xfce4-power-manager &
dunst &
setxkbmap -layout us,it,de -option grp:win_space_toggle -option compose:lwin
autorandr --change
exec wmaker
