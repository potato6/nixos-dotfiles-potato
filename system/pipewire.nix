{ ... }:
{
  security.rtkit.enable = true; # RealtimeKit system service
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
  };
}
