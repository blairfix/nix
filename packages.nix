{ pkgs, ... }: {
    environment.systemPackages = with pkgs;  [ 

	# iso generator
	nixos-generators

	# vm 
	#spice
	#gnome-boxes

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
	kdePackages.dolphin

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
	ncdu
	xlsx2csv 
	rename
	radian

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
	ghostscript
	csvtool
	yt-dlp
	poppler_utils

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
	audacity

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
	onlyoffice-bin

	# documents viewers
	kdePackages.okular
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
	imagemagickBig
	imv

	# audio and video tools
	audacity 
	cheese
	ffmpeg
	vlc
	kazam

	# video editing
	shotcut

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
	#k3b
	cdrtools
	cdrdao

	# hugo
	hugo


	];
}
