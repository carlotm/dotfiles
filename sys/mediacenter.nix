{ config, pkgs, ... }:
let
	hostname = "melee";
	user = "mc";
	essid = "AscaniFerretti";
	password_user = "$y$j9T$xx9s8/V2nKlTKOprcsked1$YObCHNQ/AJ00sN7KaC2KKBpiVJfM6FXxJtoH45oWNy/";
	password_wifi = "g:B4$1F\\A\\@X.";

	home-manager = fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in
{
	imports = [
		./hardware-configuration.nix 
		(import "${home-manager}/nixos")
	];

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
		pkgs.git
		pkgs.gnumake
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
	programs.vim.defaultEditor = true;
	programs.git.enable = true;
	programs.git.config.init.defaultBranch = "main";
	programs.git.config.user.name = "Ascani Carlo";
	programs.git.config.user.email = "carlotm@protonmail.com";
	programs.git.config.alias.co = "checkout";
	programs.git.config.alias.s = "status";

	home-manager.users."${user}" = { lib, ... } : {

		home.stateVersion = "23.11";

		gtk.enable = true;
		gtk.cursorTheme.package = pkgs.gnome.adwaita-icon-theme;
		gtk.cursorTheme.name = "Adwaita";
		gtk.cursorTheme.size = 48;
		gtk.font.name = "DejaVu Sans";
		gtk.font.package = pkgs.dejavu_fonts;
		gtk.font.size = 18;

		home.pointerCursor.package = pkgs.gnome.adwaita-icon-theme;
		home.pointerCursor.name = "Adwaita";
		home.pointerCursor.size = 48;
		home.pointerCursor.x11.enable = true;
		home.pointerCursor.gtk.enable = true;

		dconf.settings = with lib.hm.gvariant; {
			"org/gnome/Console" = {
				font-scale = 1.8000000000000007;
				last-window-size = mkTuple [ 859 534 ];
			};
			"org/gnome/control-center" = {
				last-panel = "power";
				window-state = mkTuple [ 980 640 false ];
			};
			"org/gnome/desktop/app-folders" = {
				folder-children = [ "Utilities" "YaST" "Pardus" ];
			};
			"org/gnome/desktop/app-folders/folders/Pardus" = {
				categories = [ "X-Pardus-Apps" ];
				name = "X-Pardus-Apps.directory";
				translate = true;
			};
			"org/gnome/desktop/app-folders/folders/Utilities" = {
				apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
				categories = [ "X-GNOME-Utilities" ];
				name = "X-GNOME-Utilities.directory";
				translate = true;
			};
			"org/gnome/desktop/app-folders/folders/YaST" = {
				categories = [ "X-SuSE-YaST" ];
				name = "suse-yast.directory";
				translate = true;
			};
			"org/gnome/desktop/input-sources" = {
				sources = [ (mkTuple [ "xkb" "us" ]) ];
				xkb-options = [ "terminate:ctrl_alt_bksp" ];
			};
			"org/gnome/desktop/notifications" = {
				application-children = [ "org-gnome-console" "gnome-power-panel" ];
			};
			"org/gnome/desktop/notifications/application/gnome-power-panel" = {
				application-id = "gnome-power-panel.desktop";
			};
			"org/gnome/desktop/notifications/application/org-gnome-console" = {
				application-id = "org.gnome.Console.desktop";
			};
			"org/gnome/desktop/session" = {
				idle-delay = mkUint32 0;
			};
			"org/gnome/epiphany" = {
				ask-for-default = false;
			};
			"org/gnome/evolution-data-server" = {
				migrated = true;
			};
			"org/gnome/nautilus/preferences" = {
				migrated-gtk-settings = true;
			};
			"org/gnome/settings-daemon/plugins/power" = {
				power-button-action = "interactive";
				sleep-inactive-ac-type = "nothing";
			};
			"org/gnome/shell" = {
				last-selected-power-profile = "performance";
				welcome-dialog-last-shown-version = "45.5";
			};
			"org/gnome/shell/world-clocks" = {
				locations = [];
			};
		};
	};

	system.stateVersion = "23.11";
}
