#!/bin/bash

TIME=$(date +%Y%d%m%k%M%S)
FILENAME="v.$TIME"

xrandr --output DP-1 --mode 1920x1080

recordmydesktop \
    -o $FILENAME \
    -x 1 -y 1 \
    --width 1919 --height 1079 \
    --no-wm-check \
    --delay 4 \
    --v_quality 50 \
    --v_bitrate 2000000 \
    --s_quality 2 \
    --channels 2 \
    --freq 44100 \
    --use-jack system:capture_1 system:capture_2

xrandr --output DP-1 --mode 2560x1440

echo "Done. Wrote $FILENAME.ogv"
