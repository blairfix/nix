{ config, ... }:
{

    systemd.user.timers."dropsync" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-*  *:05:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "dropsync.service";
	};
    };

    systemd.user.services."dropsync" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/Dropbox/bin/dropsync";
	};
    };

}
