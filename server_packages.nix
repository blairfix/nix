{ pkgs, ... }:
{

    services.jellyfin = {
	enable = true;
	openFirewall = true;
    };

    environment.systemPackages = [

	# jellyfin
	pkgs.jellyfin
	pkgs.jellyfin-web
	pkgs.jellyfin-ffmpeg


    ];

}
