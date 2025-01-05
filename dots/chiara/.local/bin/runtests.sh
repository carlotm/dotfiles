#! /bin/sh

testSystem() {
    assertEquals "elaine" $(cat /etc/hostname)

    assertTrue "[ -r /home/chiara ]"

    output=$(hash keepassxc)
    assertTrue "${output}" $?
}

. shunit2
