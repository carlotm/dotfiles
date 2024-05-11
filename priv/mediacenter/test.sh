#! /bin/sh

testSystem() {
    assertEquals "melee" $(cat /etc/hostname)

    assertTrue "[ -r /home/gianfranco ]"
    assertTrue "[ -r /home/gianfranco/wallpaper.jpg ]"

    output=$(grep "Gian Franco" /etc/gitconfig)
    assertTrue "${output}" $?

    output=$(hash xmonad)
    assertFalse "${output}" $?

    output=$(hash devbox)
    assertFalse "${output}" $?

    output=$(hash starship)
    assertFalse "${output}" $?
}

. shunit2
