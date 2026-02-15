{ ... }:
{

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
    RuntimeWatchdogSec = "15s";
  };

  services.journald.extraConfig = ''
    SystemMaxUse=50M
    MaxUse=1G
    DefaultTimeoutStopSec=10s
  '';

  systemd.services."user@".serviceConfig = {
    Delegate = "yes"; # enables full delegation including cpu cpuset io memory pids
  };
}
