
{ config, pkgs, ... }:

{
    imports =
	[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	];

    # bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Define your hostname.
    networking.hostName = "blair_laptop"; 

    # networking
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "America/Edmonton";

    # internationalisation properties
    i18n.defaultLocale = "en_CA.UTF-8";


    # enable sway window manager
    programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
    };


    # CUPS to print documents.
    services.printing.enable = true;

    # tailscale
    services.tailscale.enable = true;

    # ssh
    services.openssh.enable = true;

    # sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.blair = {
	isNormalUser = true;
	description = "blair";
	extraGroups = [ "networkmanager" "wheel" ];
    };

    # unfree packages
    nixpkgs.config.allowUnfree = true;

    # fonts
    fonts.packages = with pkgs; [

	freefont_ttf
	noto-fonts 
	dejavu_fonts
	ubuntu-font-family 
	liberation_ttf
	font-awesome
	roboto

    ];

    # system packages
    environment.systemPackages = with pkgs; [

	# wayland, sway and associated utilities
	sway
	swaybg
	xwayland
	light
	gammastep
	wl-clipboard 
	wtype
	sway-launcher-desktop

	# browser
	firefox 
	geckodriver 
	lynx

	# file browser
	dolphin

	# terminal 
	alacritty 
	fzf 
	ripgrep
	eza
	fd
	tree

	# utilities
	git
	htop 
	trash-cli 
	man-db 
	man-pages
	wget
	unrar
	aspell
	gnuplot
	wdiff
	exiftool
	qpdf
	

	# linode
	s3cmd
	certbot

	# audio
	pavucontrol

	# ssh and network
	openssh 
	sshpass
	openvpn
	tailscale
	rtorrent

	# latex
	texliveFull
	texstudio


	# text editors and command line tools for text
	neovim 
	pandoc
	pandoc-eqnos
	haskellPackages.pandoc-crossref
	python311Packages.docx2txt
	typos
	proselint

	# office suites
	libreoffice
	wpsoffice

	# documents viewers
	okular 
	evince
	calibre
	zathura

	# image viewers and image manipulation
	feh 
	inkscape 
	gimp 
	pngquant 
	jpegoptim 
	imagemagick
	imv

	# audio and video tools
	audacity 
	gnome.cheese
	ffmpeg
	vlc
	kazam

	# finance
	gnucash

	# audio meta data
	kid3

	# syncing utilities
	rclone
	rsync
	syncthing

	# misc tools
	pdfgrep 
	engauge-digitizer


	# android packages
	libmtp
	heimdall
	android-tools

	# icon themes
	lxappearance
	#breeze

	# screenshot
	grim
	slurp

	# cd
	k3b
	cdrtools
	cdrdao

	# hugo
	hugo

	# meetings
	skypeforlinux
	zoom

    ];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.05"; # Did you read the comment?

}
