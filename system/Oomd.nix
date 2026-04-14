{ ... }:
{
  systemd.oomd = {
    enable = true; # keep it on, just neuter it
    settings.OOM = {
      # Make the default pressure threshold stupid high → only acts when you're basically already OOM
      DefaultMemoryPressureLimit = "95%";
      DefaultMemoryPressureDurationSec = "120"; # wait 2 full minutes of sustained high pressure before killing anything

      SwapUsedLimit = "98%"; # this makes it care way less about swap thrashing
    };
  };
}
