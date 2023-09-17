#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
xsetroot -solid "#143971" &
xfce4-panel &
xrdb ~/.Xresources &
setxkbmap -layout us,it,de -option grp:win_space_toggle &
autorandr --change && exec awesome
