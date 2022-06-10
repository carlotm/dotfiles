#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
flameshot &
xsetroot -solid "#161616" &
xsetroot -cursor_name left_ptr &
xfce4-power-manager &
exec qtile start
