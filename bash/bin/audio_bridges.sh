#!/bin/bash
a2jmidi_bridge &
${HOME}/bin/jack-pulseaudio-bridge.sh &
