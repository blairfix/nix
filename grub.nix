{ config, ... }:
{

    # grub
    boot.loader = {
	systemd-boot.enable = false;
	efi = {
	    canTouchEfiVariables = true;
	    efiSysMountPoint = "/boot";
	};
	grub = {
	    devices = [ "nodev" ];
	    enable = true;
	    efiSupport = true;
	    useOSProber = true;
	};
    };

}