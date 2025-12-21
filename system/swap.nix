{ ... }: {

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd"; # compression
    priority = 100; # Prioritize zswap
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 10240; # 10GB swap
    priority = 1; # Low priority over zram
  }];

  boot.kernelParams = [ "zswap.enabled=0" ];

}
