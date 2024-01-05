#!/usr/bin/env bash
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export XDG_CONFIG_HOME=$HOME/.config
exec startxfce4
