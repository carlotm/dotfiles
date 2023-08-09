#!/usr/bin/env bash

xrdb ~/.Xresources
xfce4-power-manager &
autorandr --change
dunst &
setxkbmap -layout us,it,de -option grp:win_space_toggle
exec wmaker
