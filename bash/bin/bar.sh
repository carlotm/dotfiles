#!/bin/sh

bclock() {
    printf "%s" "$(date "+%A %d %B  %T")"
}

bbattery () {
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$STATUS" = "Charging" ]; then
        printf "\uf1e6 %s%%   " "$CHARGE"
    else
        if (( $CHARGE > 90 )); then
            printf "\uf240 %s%%   " "$CHARGE"
        elif (( $CHARGE > 55 )); then
            printf "\uf241 %s%%   " "$CHARGE"
        elif (( $CHARGE > 45 )); then
            printf "\uf242 %s%%   " "$CHARGE"
        elif (( $CHARGE > 24 )); then
            printf "\uf243 %s%%   " "$CHARGE"
        else
            printf "\uf244 %s%%   " "$CHARGE"
        fi
    fi
}

bvol() {
    VOL=$(pamixer --get-volume-human | tr -d '%')

    if [ "$VOL" = "muted" ] || [ "$VOL" -eq 0 ]; then
        printf "\uf6a9   "
    elif [ "$VOL" -gt 75 ]; then
        printf "\uf028 %s%%   " "$VOL"
    else
        printf "\uf027 %s%%   " "$VOL"
    fi
}

while true
do
    xsetroot -name "$(bvol)$(bbattery)$(bclock)"
    sleep 1
done
