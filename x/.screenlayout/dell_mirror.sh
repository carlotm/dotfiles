#!/bin/sh

RES=1024x768

VGA1="--off"
LVDS1="--primary --mode $RES --panning $RES"
HDMI1="--off"
HDMI2="--off"
HDMI3="--off"
DP1="--mode $RES --same-as LVDS-1"
DP2="--off"
DP3="--off"

xrandr \
    --output LVDS-1 ${LVDS1} \
    --output VGA-1  ${VGA1}  \
    --output HDMI-1 ${HDMI1} \
    --output HDMI-2 ${HDMI2} \
    --output HDMI-3 ${HDMI3} \
    --output DP-1   ${DP1}   \
    --output DP-2   ${DP2}   \
    --output DP-3   ${DP3}

