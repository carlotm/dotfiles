#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
xrdb ~/.Xresources &
setxkbmap -layout us,it,de -option grp:win_space_toggle &
exec awesome
