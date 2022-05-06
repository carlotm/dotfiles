#!/usr/bin/env bash

autorandr --change &
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
xsetroot -cursor_name Hackneyed &
xfce4-power-manager &
exec xmonad
