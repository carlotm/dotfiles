#! /bin/sh

testSystem() {
    assertEquals "scumm" $(cat /etc/hostname)

    assertTrue "[ -r /home/carloratm ]"
    assertTrue "[ -r /home/carloratm/w ]"
    assertTrue "[ -r /home/carloratm/downloads ]"

    output=$(grep "Ascani Carlo" /etc/gitconfig)
    assertTrue "${output}" $?

    output=$(hash spectrwm)
    assertTrue "${output}" $?

    output=$(hash alacritty)
    assertTrue "${output}" $?

    output=$(hash xmonad)
    assertFalse "${output}" $?

    output=$(hash xfce4)
    assertFalse "${output}" $?

    output=$(hash devbox)
    assertTrue "${output}" $?

    output=$(hash starship)
    assertTrue "${output}" $?

    output=$(hash nix)
    assertTrue "${output}" $?

    output=$(hash qutebrowser)
    assertTrue "${output}" $?
}

. shunit2
