#!/bin/bash

echo -e "power on\n connect 90:7F:61:03:88:CA\n" | bluetoothctl
sleep 1
echo -e "power on\n connect 08:EF:3B:82:2F:F5\n" | bluetoothctl
echo wmaker > /tmp/.wmanager
rm -f /tmp/.amiga
touch /tmp/.kodi
pkill X
