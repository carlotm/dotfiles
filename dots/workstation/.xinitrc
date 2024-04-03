#!/usr/bin/env bash
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
setxkbmap -layout us,it,de -option grp:win_space_toggle
exec startxfce4
