if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/carloratm/.nix-profile/etc/profile.d/nix.sh ]; then . /home/carloratm/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
