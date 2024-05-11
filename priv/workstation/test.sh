#! /bin/sh

testSystem() {
    assertEquals "scumm" $(cat /etc/hostname)

    assertTrue "[ -r /home/carloratm ]"
    assertTrue "[ -r /home/carloratm/w ]"
    assertTrue "[ -r /home/carloratm/downloads ]"

    output=$(grep "Ascani Carlo" /etc/gitconfig)
    assertTrue "${output}" $?

    output=$(hash xmonad)
    assertTrue "${output}" $?

    output=$(hash devbox)
    assertTrue "${output}" $?

    output=$(hash starship)
    assertTrue "${output}" $?
}

. shunit2
