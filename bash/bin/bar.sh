#!/bin/sh

bclock() {
    printf "%s" "$(date "+%A %d %B  %H:%M")"
}

bbattery () {
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$STATUS" = "Charging" ]; then
        printf "\ue239%s%%   " "$CHARGE"
    else
        if (( $CHARGE > 90 )); then
            printf "\ue238%s%%   " "$CHARGE"
        elif (( $CHARGE > 5 )); then
            printf "\ue237%s%%   " "$CHARGE"
        else
            printf "\ue236%s%%   " "$CHARGE"
        fi
    fi
}

bvol() {
    VOL=$(pamixer --get-volume-human | tr -d '%')

    if [ "$VOL" = "muted" ] || [ "$VOL" -eq 0 ]; then
        printf "\ue84f   "
    else
        printf "\ue05d%s%%   " "$VOL"
    fi
}

while true
do
    xsetroot -name "$(bvol)$(bbattery)$(bclock)"
    sleep 1
done
