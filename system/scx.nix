{ ... }: {
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [ "--enable-cpu-bw" "--autopower" ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  boot.kernelParams = [ "amd_pstate=guided" ];

}
