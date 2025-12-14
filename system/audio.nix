{ ... }: {
  security.rtkit.enable = true; # RealtimeKit system service
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };
}
