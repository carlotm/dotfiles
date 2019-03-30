#!/usr/bin/env bash

pcs() { for i in {0..7}; do echo -en "\e[$((40+$i))m \e[0m"; done }
pcs2() { for i in {0..7}; do echo -en "\e[7m\e[$((90+$i))m \e[0m"; done }

printf "%s\n%s\n" "$(pcs)" "$(pcs2)"
