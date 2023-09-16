#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
xsetroot -solid "#143971" &
exec startxfce4
