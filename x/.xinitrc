#!/usr/bin/env bash

autorandr --change &
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
flameshot &
feh --bg-scale ~/.config/qtile/gradient.jpg &
xsetroot -cursor_name left_ptr &
xfce4-power-manager &
exec qtile start
