{ ... }: {
  services = {
    timesyncd.enable = false;
    ntpd-rs = {
      enable = true;
      useNetworkingTimeServers = true;
    };
  };
}
