/etc/nixos/configuration.nix: sys/miggipi.nix
	install -Dm644 $< $@
	NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch
