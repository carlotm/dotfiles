#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
flameshot &
feh --bg-tile ~/.config/qtile/bg.png &
xsetroot -cursor_name left_ptr &
xfce4-power-manager &
exec qtile start
