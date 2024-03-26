{ config, pkgs, ... }:
let
	hostname = "melee";
	user = "mc";
	essid = "AscaniFerretti";
	password_user = "$y$j9T$xx9s8/V2nKlTKOprcsked1$YObCHNQ/AJ00sN7KaC2KKBpiVJfM6FXxJtoH45oWNy/";
	password_wifi = "g:B4$1F\\A\\@X.";

	nixos-hw = fetchTarball "https://github.com/NixOS/nixos-hardware/tarball/master";
	home-manager = fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
	imports = [ ./hardware-configuration.nix ];

	hardware.pulseaudio.enable = false;

	sound.enable = true;

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	security.rtkit.enable = true;

	networking.hostName = "${hostname}";
	networking.networkmanager.enable = false;
	networking.wireless.enable = true;
	networking.wireless.networks."${essid}".psk = "${password_wifi}";
	networking.wireless.interfaces = [ "wlan0" ];
	networking.dhcpcd.enable = false;
	networking.interfaces."wlan0".ipv4.addresses = [{
		address = "192.168.1.109";
		prefixLength = 24;
	}];
	networking.defaultGateway = "192.168.1.1";
	networking.nameservers = [ "208.67.222.222" "208.67.220.220" ];

	time.timeZone = "Europe/Vienna";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "it_IT.UTF-8";
		LC_IDENTIFICATION = "it_IT.UTF-8";
		LC_MEASUREMENT = "it_IT.UTF-8";
		LC_MONETARY = "it_IT.UTF-8";
		LC_NAME = "it_IT.UTF-8";
		LC_NUMERIC = "it_IT.UTF-8";
		LC_PAPER = "it_IT.UTF-8";
		LC_TELEPHONE = "it_IT.UTF-8";
		LC_TIME = "it_IT.UTF-8";
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = [
		pkgs.vim 
		pkgs.firefox
	];

	users.mutableUsers = false;
	users.users."${user}" = {
		isNormalUser = true;
		hashedPassword = "${password_user}";
		description = "${user}";
		extraGroups = [ "wheel" ];
	};

	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbVariant = "";
	services.printing.enable = false;
	services.pipewire.enable = true;
	services.pipewire.alsa.enable = true;
	services.pipewire.alsa.support32Bit = true;
	services.pipewire.pulse.enable = true;
	services.xserver.displayManager.autoLogin.enable = true;
	services.xserver.displayManager.autoLogin.user = "mc";
	services.openssh.enable = true;

	systemd.services."getty@tty1".enable = false;
	systemd.services."autovt@tty1".enable = false;

	programs.gnupg.agent.enable = true;
	programs.gnupg.agent.enableSSHSupport = true;

	system.stateVersion = "23.11";
}
