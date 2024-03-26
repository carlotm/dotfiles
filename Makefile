pi: sys/pi.nix
	install -Dm644 $< /etc/nixos/configuration.nix
	NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch

mediacenter: sys/mediacenter.nix
	install -Dm644 $< /etc/nixos/configuration.nix
	nixos-rebuild switch
