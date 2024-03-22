/etc/nixos/configuration.nix: sys/miggipi.nix
	install -Dm644 $< $@
	nixos-rebuild switch
