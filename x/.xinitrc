#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
xbindkeys &
dunst &
exec $(which wmaker)
