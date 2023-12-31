{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  [ 

	# iso generator
	nixos-generators

	# vm clipboard
	spice

	# sway and associated utilities
	swaybg
	xwayland
	light
	gammastep
	wl-clipboard 
	wtype
	sway-launcher-desktop
	waybar

	# browser
	firefox 
	geckodriver 
	lynx

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

	# utilities
	git
	htop 
	bottom
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
	linode-cli
	s3cmd
	certbot

	# audio
	pavucontrol
	pulseaudio

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
	dropbox
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
