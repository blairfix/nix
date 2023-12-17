{ config, ... }:
{
    # blair backup 
    #----------------------------------------

    systemd.timers."blair_backup" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "OnCalendar=*-*-* 01:00:0";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "blair_backup.service";
	};
    };

    systemd.services."blair_backup" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/blair_backup";
	};
    };


    # camera sync
    #----------------------------------------

    systemd.timers."camera_sync" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* *:00:00";
	    RandomizedDelaySec = "40";
	    Persistent = "true";
	    Unit = "camera_sync.service";
	};
    };

    systemd.services."camera_sync" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/camera_sync";
	};
    };

    

}
