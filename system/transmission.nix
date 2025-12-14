{ pkgs, ... }: {
  # hosted on link
  # http://127.0.0.1:9091/transmission/web/
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
    openPeerPorts = true;
    openRPCPort = true;
    settings = {
      umask = "0";
      download-dir = "/mnt/DISCO/Torrents/Downloads";
      incomplete-dir-enabled = false;
      rpc-enabled = true;
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist-enabled = true;
      dht-enabled = true;
      pex-enabled = true;
      utp-enabled = true;
      encryption = 1;
      preallocation = 1;
      rpc-port = 9091;
    };
  };

}

