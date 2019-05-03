#!/bin/bash

#game="$(which $1)"
game="/usr/bin/fs-uae-arcade"
openbox="$(which openbox)"
tmpgame="/tmp/tmpgame.sh"
DISPLAY=:1.0
echo -e "${openbox} &\n${game}" > ${tmpgame}
echo "starting ${game}"
xinit ${tmpgame} -- :1 -xf86config xorg-game.conf || exit 1

