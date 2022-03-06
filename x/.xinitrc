#!/usr/bin/env bash

xrdb -merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
xbindkeys &
dunst &
exec $(which wmaker)
