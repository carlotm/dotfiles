#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
xsetroot -cursor_name left_ptr &
xfce4-power-manager &
exec wmaker
