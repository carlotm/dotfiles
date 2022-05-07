#!/usr/bin/env bash

autorandr --change &
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
feh --bg-scale ~/Pictures/Backgrounds/gradient.jpg &
xsetroot -cursor_name left_ptr &
xfce4-power-manager &
exec xmonad
