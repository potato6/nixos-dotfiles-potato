{ pkgs, ... }: {
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_bpfland";
    extraArgs = [ "--local-kthreads" ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  boot.kernelParams = [ "amd_pstate=guided" ];

}
