#!/usr/bin/env bash

xrdb -merge ~/.Xresources
setxkbmap us
xsetroot -solid "#777777"
exec dwm
