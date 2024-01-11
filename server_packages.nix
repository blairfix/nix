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

    # nextcloud
    #-------------------------------------------

    services.nextcloud = {                
	enable = true;                   
	package = pkgs.nextcloud28;
	hostName = "localhost";
	config.adminpassFile = "/etc/nextcloud-admin-pass";
	    extraApps = with config.services.nextcloud.package.packages.apps; {
		inherit contacts calendar tasks;
	    };
	extraAppsEnable = true;
    };


#
#    # Photoprism
#    #-------------------------------------------
#
#    services.photoprism = {
#	enable = true;
#	port = 2342;
#	originalsPath = "/var/lib/private/photoprism/originals";
#	address = "0.0.0.0";
#	settings = {
#
#	    PHOTOPRISM_SITE_URL = "http://localhost:2342/";
#	    PHOTOPRISM_SITE_TITLE = "Fix Family Photos";
#	    PHOTOPRISM_SITE_CAPTION = "Fix Family Photos";
#	    PHOTOPRISM_ADMIN_USER = "admin";
#	    PHOTOPRISM_ADMIN_PASSWORD = "...";
#	    PHOTOPRISM_DEFAULT_LOCALE = "en";
#	    PHOTOPRISM_DATABASE_DRIVER = "mysql";
#	    PHOTOPRISM_DATABASE_NAME = "photoprism";
#	    PHOTOPRISM_DATABASE_SERVER = "/run/mysqld/mysqld.sock";
#	    PHOTOPRISM_DATABASE_USER = "photoprism";
#	    PHOTOPRISM_HTTP_COMPRESSION = "gzip";
#	    PHOTOPRISM_READONLY = "true"; 
#
#	};
#    };
#
#    # MySQL
#    services.mysql = {
#	enable = true;
#	#dataDir = "/data/mysql";
#	package = pkgs.mariadb;
#	ensureDatabases = [ "photoprism" ];
#	ensureUsers = [ {
#	    name = "photoprism";
#	    ensurePermissions = {
#		"photoprism.*" = "ALL PRIVILEGES";
#	    };
#	} ];
#    };
#
#    # originals path
#    fileSystems."/var/lib/private/photoprism/originals/pictures" =
#    { device = "/home/blair/test";
#	options = [ "bind" ];
#    };
#

}
