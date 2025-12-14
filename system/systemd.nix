{ ... }: {

  systemd.settings.Manager = { DefaultTimeoutStopSec = "10s"; };

  services.journald.extraConfig = ''
    SystemMaxUse=50M
    MaxUse=1G
  '';
  systemd.services."user@".serviceConfig = {
    Delegate =
      "yes"; # enables full delegation including cpu cpuset io memory pids
  };
}

