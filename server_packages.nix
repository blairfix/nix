{ pkgs, ... }:
{

    
    # docker
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };


    # jellyfin
    #-------------------------------------------

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
