#!/usr/bin/env bash
pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"; done; }
printf "%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
