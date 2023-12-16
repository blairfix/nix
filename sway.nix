
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

    # Enables wireless support via wpa_supplicant.
    networking.wireless.enable = true;  

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

    # system packages

    environment.systemPackages = with pkgs; [

	# wayland, sway and associated utilities
	sway
	swaybg
	xorg-xwayland
	light
	gammastep
	wl-clipboard 

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
	exa
	fd
	tree

	# utilities
	htop 
	trash-cli 
	man-db 
	man-pages
	wget
	pacman-contrib
	unrar
	aspell
	aspell-en
	gnuplot
	wdiff
	perl-image-exiftool
	qpdf

	# computation
	#openblas
	blas

	# linode
	s3cmd
	certbot

	# audio
	alsa-utils
	pulseaudio
	pavucontrol

	# ssh and network
	openssh 
	sshpass
	openvpn
	networkmanager-openvpn
	network-manager-applet
	tailscale
	rtorrent

	# latex
	texlive-basic
	texlive-latexrecommended
	texlive-plaingeneric
	texlive-fontsrecommended

	texlive-fontsextra 
	texlive-bibtexextra 
	texlive-latexextra

	texstudio


	# text editors and command line tools for text
	neovim 
	pandoc
	docx2txt

	# office suites
	libreoffice-fresh


	# documents viewers
	okular 
	evince
	calibre
	zathura
	zathura-pdf-mupdf

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
	cheese 
	ffmpeg
	vlc

	# finance
	gnucash

	# audio meta data
	kid3

	# syncing utilities
	rclone
	rsync
	syncthing

	# misc command line tools
	xdotool 
	gprename 
	pdfgrep 
	xclip 
	source-highlight


	# android packages
	libmtp
	heimdall
	android-tools

	# icon themes
	lxappearance
	breeze

	# screenshot
	grim
	slurp

	# cd
	k3b
	cdrtools
	cdrdao
	dvd+rw-tools

	# hugo
	hugo
	nodejs
	npm


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
