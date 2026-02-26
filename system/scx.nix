{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_bpfland";
    extraArgs = [
      "--local-kthreads"
    ];
  };

  boot.kernelParams = [ "amd_pstate=active" ];

}
