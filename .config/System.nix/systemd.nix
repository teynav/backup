{ config, pkgs, ... }:
{
   systemd.services.battery_stop_one = {
   description = "Stop battery charge during start";
   enable=true;
   after=[ "systemd-user-sessions.service" "plymouth-quit-wait.service" "rc-local.service" ];
   before=[ "getty.target" ];
   serviceConfig = {
     User = "root";
     Type = "oneshot";
     ExecStart = "${pkgs.bash}/bin/bash -c 'echo 77 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
   };
      wantedBy = [ "default.target" ];
  };


   systemd.services.battery_stop_two = {
   description = "Stop battery charge during sleeps";
   enable=true;
   after=["suspend.target" "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target"];
   serviceConfig = {
     User = "root";
     Type = "oneshot";
     ExecStart = "${pkgs.bash}/bin/bash -c 'echo 77 > /sys/class/power_supply/BAT0/charge_control_end_threshold'";
   };
      wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target" ];
  };

}
