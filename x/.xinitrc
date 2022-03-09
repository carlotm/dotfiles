#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources &
xbindkeys &
dunst &
exec $(which wmaker)
