{ config, pkgs, lib, ... }:
{
	boot = {
		kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
		initrd.availableKernelModules = [
			"xhci_pci"
			"usbhid"
			"usb_storage"
		];
		loader.grub.enable = false;
		loader.generic-extlinux-compatible.enable = true;
	};

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-label/NIXOS_SD";
			fsType = "ext4";
			options = [ "noatime" ];
		};
	};

	networking = {
		hostName = "miggipi";
		wireless = {
			enable = true;
			networks.AscaniFerretti.psk = "g:B4$1F\\A\\@X.";
			interfaces = [ "wlan0" ];
		};
	};

	environment.systemPackages = [
		pkgs.vim
		pkgs.git
		pkgs.gnumake
  ];

	services.openssh.enable = true;

	users = {
		mutableUsers = false;
		users.carloratm = {
			isNormalUser = true;
			initialPassword = "changeme";
			extraGroups = [ "wheel" ];
		};
	};

	security.sudo = {
		enable = true;
		extraRules = [{
			commands = [
			{
				command = "${pkgs.systemd}/bin/systemctl suspend";
				options = [ "NOPASSWD" ];
			}
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
	};

	services.xserver.enable = true;
	services.xserver.displayManager.startx.enable = true;
	services.xserver.windowManager.jwm.enable = true;

	programs.vim.defaultEditor = true;
	programs.git.enable = true;
	programs.git.config = {
		init.defaultBranch = "main";
		user.name = "Ascani Carlo";
		user.email = "carlotm@protonmail.com";
		alias.co = "checkout";
		alias.s = "status";
	};

	hardware.enableRedistributableFirmware = true;
	system.stateVersion = "24.05";
}
