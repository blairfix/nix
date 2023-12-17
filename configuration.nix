{ config, pkgs, ... }:

{
    imports =
	[ 
	    ./hardware-configuration.nix
	    ./r_packages.nix
	    ./python_packages.nix
	    ./system_packages.nix
	    ./fonts.nix
	    ./nvim.nix
	];

    # vm
    services.spice-vdagentd.enable = true;

    # bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # hostname
    networking.hostName = "blair_laptop"; 

    # networking
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "America/Edmonton";

    # utf8 setting
    i18n.defaultLocale = "en_CA.UTF-8";

    # enable sway window manager
    programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
    };

    # cups
    services.printing.enable = true;

    # tailscale
    services.tailscale.enable = true;

    # ssh
    services.openssh.enable = true;

    # sound with pipewire
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

    # user account. Add password with ‘passwd’.
    users.users.blair = {
	isNormalUser = true;
	description = "blair";
	extraGroups = [ "networkmanager" "wheel" ];
    };

    # unfree packages
    nixpkgs.config.allowUnfree = true;


    # for bash scripts 
    services.envfs.enable = true;

    # home directories
    systemd.tmpfiles.rules = [
	"d /home/blair/Desktop 755 blair users -"
	"d /home/blair/Downloads 755 blair users -"
	"d /home/blair/bin 755 blair users -"
    ];


    # version 
    system.stateVersion = "23.05"; 

}
