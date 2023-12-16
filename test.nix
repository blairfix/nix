
{ config, pkgs, ... }:

{
    imports =
	[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	];

    # bootloader
    #boot.loader.systemd-boot.enable = true;
    #boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.grub = {
	enable = true;
	useOSProber = true;
	device = "/dev/vda1";
	efiSupport = true;
    };

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "blair_laptop"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

    # X11 windowing system
    #services.xserver.enable = true;

    # KDE plasma 
    #services.xserver.displayManager.sddm.enable = true;
    #services.xserver.desktopManager.plasma5.enable = true;

    # keymap in X11
#    services.xserver = {
#	layout = "us";
#	xkbVariant = "";
#    };

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

    environment.systemPackages = with pkgs;
    let
	R-with-my-packages = rWrapper.override{ 
	    packages = with rPackages; [ 

		# R packages
		#ggplot2 
		#dplyr 
		#data_table
		#Rcpp
		#RcppArmadillo
		#BH
		#mailR
		#sf
		
		# blair's packages
		(buildRPackage {
		 name = "bfstr";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstr";
		 rev = "master";
		 sha256 = "sha256-3MT+tTQpcpoNbknadRf1QBPI0EXm3q+nMuL8GJ20bFM";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfstat";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstat";
		 rev = "master";
		 sha256 = "sha256-fuCCJZHZoXkVycMnHZ37HGd2wwetLbAVWryjBNeWSUc";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfgg";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfgg";
		 rev = "master";
		 sha256 = "sha256-y2E8QYjiuHHVxgS+LXv5nYL8RBFDekD5nYgRdNZly7g";
		 };
		 propagatedBuildInputs = [ ggplot2 gridExtra data_table here ];
		 })
	    ]; 
	};
    in [

	    R-with-my-packages

	    # packages
	    spice-vdagent

	    wget
	    proselint

	    pandoc
	    pandoc-eqnos
	    git

	    gnumake
	    gcc13
	    armadillo
	    geckodriver
	    lynx
	    fzf
	    ripgrep
	    fd
	    trash-cli

	    zathura
	    rsync
	    rclone
	    syncthing
	    kid3
	    boost

	    firefox
	    neovim
	    tailscale
	    alacritty  
	    libreoffice
	    htop
	    hugo
	    
	    # python
	    (python3.withPackages(ps: with ps; [ 

				  pandas 
				  datetime
				  tqdm
				  grip
				  imutils
				  linode-cli
				  python310Packages.selenium
				  python310Packages.radian

	    ]))
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
