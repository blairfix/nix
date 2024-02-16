{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  [ 

	# iso generator
	nixos-generators

	# vm 
	spice
	gnome.gnome-boxes

	# sway and associated utilities
	swaybg
	xwayland
	brightnessctl
	gammastep
	wl-clipboard 
	wtype
	sway-launcher-desktop
	waybar

	# browser
	firefox 
	geckodriver 
	lynx
	nodePackages.mathjax

	# file browser
	gnome.nautilus
	dolphin

	# terminal 
	alacritty 
	fzf 
	ripgrep
	eza
	fd
	tree
	killall
	unzip
	zip
	file


	# utilities
	git
	htop 
	bottom
	trash-cli 
	man-db 
	man-pages
	wget
	unrar
	gnuplot
	wdiff
	exiftool
	qpdf

	# spell check
	aspell
	aspellDicts.en
	aspellDicts.en-science


	# linode
	linode-cli
	s3cmd
	certbot

	# audio
	pavucontrol
	pulseaudio

	# ssh and network
	networkmanagerapplet
	openssh 
	sshpass
	openvpn
	tailscale
	rtorrent

	# latex
	texliveFull
	texstudio


	# text editors and command line tools for text
	#neovim 
	vimPlugins.vim-plug
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
	foliate
	#calibre
	zathura

	# image viewers and image manipulation
	feh 
	inkscape 
	gimp 
	pngquant 
	jpegoptim 
	#imagemagick
	imagemagickBig
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
	borgbackup

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

	# containers
	docker-compose
	

	];
}
