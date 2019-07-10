#!/bin/bash
game="/usr/bin/fs-uae-arcade"
openbox="$(which openbox)"
tmpgame="/tmp/tmpgame.sh"
DISPLAY=:1.0
echo -e "${openbox} &\n${game}" > ${tmpgame}
xinit ${tmpgame} -- :1 -xf86config xorg-game.conf || exit 1
