#!/bin/bash
game="fs-uae /home/carloratm/FS-UAE/Configurations/a600dev.fs-uae"
openbox="$(which openbox)"
tmpgame="/tmp/tmpgame.sh"
DISPLAY=:1.0
echo -e "${openbox} &\n${game}" > ${tmpgame}
xinit ${tmpgame} -- :1 -xf86config xorg-game.conf || exit 1
