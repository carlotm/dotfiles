#!/usr/bin/env bash

autorandr --change
xrdb -merge ~/.Xresources
setxkbmap us
exec dbus-launch leftwm
