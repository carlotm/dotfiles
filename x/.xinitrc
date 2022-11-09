#!/usr/bin/env bash

xrdb -merge ~/.Xresources
setxkbmap us
xbindkeys &
xsetroot -solid "#979797"
xfce4-power-manager &
dunst &
~/w/dwm/bar/dwm_bar.sh &
exec dwm
