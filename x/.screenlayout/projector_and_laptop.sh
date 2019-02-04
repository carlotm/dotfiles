#!/bin/sh

xrandr                      \
    --output VGA-1 --off    \
    --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
    --output HDMI-3 --off   \
    --output HDMI-2 --off   \
    --output HDMI-1 --mode 1280x720 --pos 1367x0 --rotate normal \
    --output DP-3 --off     \
    --output DP-2 --off     \
    --output DP-1 --off