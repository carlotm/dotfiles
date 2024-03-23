{ config, pkgs, lib, ... }:
let
	hostname = "miggipi";
	user = "carloratm";
	essid = "AscaniFerretti";
	password_user = "gia";
	password_wifi = "g:B4$1F\\A\\@X.";

	nixos-hw = fetchTarball "https://github.com/NixOS/nixos-hardware/tarball/master";
	home-manager = fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
	imports = [
		(import "${nixos-hw}/raspberry-pi/4")
		(import "${home-manager}/nixos")
	];

	nix.settings.auto-optimise-store = true;

	nix.gc.automatic = true;
  	nix.gc.dates = "weekly";
	nix.gc.options = "--delete-older-than 30d";

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

	networking.hostName = "${hostname}";
	networking.wireless.enable = true;
	networking.wireless.networks."${essid}".psk = "${password_wifi}";
	networking.wireless.interfaces = [ "wlan0" ];

	console.enable = false;

	environment.systemPackages = [
		pkgs.fsuae
		pkgs.fsuae-launcher
		pkgs.git
		pkgs.gnumake
		pkgs.libraspberrypi
		pkgs.raspberrypi-eeprom
		pkgs.stow
		pkgs.vim
		pkgs.python311
		pkgs.python311Packages.pyopengl	
	];

	users.mutableUsers = false;
	users.users."${user}" = {
		isNormalUser = true;
		password = "${password_user}";
		extraGroups = [ "wheel" ];
	};

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

	services.getty.autologinUser = "${user}";
	services.openssh.enable = true;
	services.xserver.enable = true;
	services.xserver.xkb.layout = "us";
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.windowManager.openbox.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.displayManager.autoLogin.enable = true;
	services.xserver.displayManager.autoLogin.user = "${user}";
	services.xserver.displayManager.defaultSession = "none+openbox";

	programs.vim.defaultEditor = true;
	programs.git.enable = true;
	programs.git.config.init.defaultBranch = "main";
	programs.git.config.user.name = "Ascani Carlo";
	programs.git.config.user.email = "carlotm@protonmail.com";
	programs.git.config.alias.co = "checkout";
	programs.git.config.alias.s = "status";

	home-manager.users."${user}" = {
		home.stateVersion = "24.05";
		xdg.configFile."openbox/rc.xml".text = ''
<?xml version="1.0" encoding="UTF-8"?>
<openbox_config xmlns="http://openbox.org/3.4/rc" xmlns:xi="http://www.w3.org/2001/XInclude">

<applications>
	<application name=".fs-uae-launcher-wrapped">
		<decor>no</decor>
		<shade>no</shade>
		<position force="no">
			<x>center</x>
			<y>center</y>
			<monitor>1</monitor>
		</position>
		<size>
			<width>100%</width>
			<height>100%</height>
		</size>
		<focus>yes</focus>
		<desktop>1</desktop>
		<layer>normal</layer>
		<iconic>no</iconic>
		<skip_pager>no</skip_pager>
		<skip_taskbar>no</skip_taskbar>
		<fullscreen>yes</fullscreen>
		<maximized>true</maximized>
	</application>
</applications>

</openbox_config>
		'';
		xdg.configFile."openbox/autostart".text = "fs-uae-launcher &";
		xdg.configFile."openbox/autostart".executable = true;
	};

	system.stateVersion = "24.05";
}
