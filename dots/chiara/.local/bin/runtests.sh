#! /bin/sh

testSystem() {
    assertEquals "elaine" $(cat /etc/hostname)

    assertTrue "[ -r /home/chiara ]"

    output=$(hash gnome3)
    assertTrue "${output}" $?

    output=$(hash keepassxc)
    assertTrue "${output}" $?
}

. shunit2
