#!/usr/bin/env bash
pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m█\e[0m"; done; }
printf "%s\n" "$(pcs)"
