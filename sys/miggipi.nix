{ config, pkgs, lib, ... }:
{
	imports = [
		"${fetchTarball "https://github.com/NixOS/nixos-hardware/tarball/master"}/raspberry-pi/4"
	];

	sound.enable = true;

	hardware.pulseaudio.enable = true;
	hardware.raspberry-pi."4".fkms-3d.enable = true;
	hardware.raspberry-pi."4".apply-overlays-dtmerge.enable = true;
	hardware.deviceTree.enable = true;
	hardware.enableRedistributableFirmware = true;

	boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
	boot.initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
	boot.loader.grub.enable = false;
	boot.loader.generic-extlinux-compatible.enable = true;

	fileSystems."/".device = "/dev/disk/by-label/NIXOS_SD";
	fileSystems."/".fsType = "ext4";
	fileSystems."/".options = [ "noatime" ];

	networking.hostName = "miggipi";
	networking.wireless.enable = true;
	networking.wireless.networks.AscaniFerretti.psk = "g:B4$1F\\A\\@X.";
	networking.wireless.interfaces = [ "wlan0" ];

	console.enable = false;

	environment.systemPackages = [
		pkgs.vim
		pkgs.git
		pkgs.gnumake
		pkgs.libraspberrypi
		pkgs.raspberrypi-eeprom
		pkgs.fsuae
		pkgs.fsuae-launcher
	];

	users.mutableUsers = false;
	users.users.carloratm.isNormalUser = true;
	users.users.carloratm.password = "gia";
	users.users.carloratm.extraGroups = [ "wheel" ];

	security.sudo.enable = true;
	security.sudo.extraRules = [{
		commands = [
			{
				command = "${pkgs.systemd}/bin/reboot";
				options = [ "NOPASSWD" ];
			}
			{
				command = "${pkgs.systemd}/bin/poweroff";
				options = [ "NOPASSWD" ];
			}
		];
		groups = [ "wheel" ];
	}];

	services.getty.autologinUser = "carloratm";
	services.openssh.enable = true;
	services.xserver = {
		enable = true;
		xkb.layout = "us";
		desktopManager.xterm.enable = false;
		windowManager.jwm.enable = true;
		displayManager.lightdm.enable = true;
		displayManager.autoLogin.enable = true;
		displayManager.autoLogin.user = "carloratm";
		displayManager.defaultSession = "none+jwm";
	};

	programs.vim.defaultEditor = true;
	programs.git.enable = true;
	programs.git.config.init.defaultBranch = "main";
	programs.git.config.user.name = "Ascani Carlo";
	programs.git.config.user.email = "carlotm@protonmail.com";
	programs.git.config.alias.co = "checkout";
	programs.git.config.alias.s = "status";

	system.stateVersion = "24.05";
}
