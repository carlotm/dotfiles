#!/usr/bin/env bash

xrdb -merge ~/.Xresources &
xfce4-power-manager &
xbindkeys &
dunst &
setxkbmap -layout us,it,de -option grp:win_space_toggle
autorandr --change
exec wmaker
