{ pkgs, ... }:

{
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
    openFirewall = true;

    # Open required ports
    openPeerPorts = true;
    openRPCPort = true;

    # Optional: use a nicer web UI
    # webHome = pkgs.flood-for-transmission;

    settings = {
      # Network / RPC (web UI)
      rpc-bind-address = "0.0.0.0"; # allow remote access
      rpc-port = 9091;
      rpc-whitelist-enabled = true;
      rpc-whitelist = "127.0.0.1,192.168.*.*"; # adjust to your LAN
      rpc-authentication-required = true;
      rpc-username = "transmission";

      # Directories
      download-dir = "/mnt/DISCO/Torrents/Downloads";
      incomplete-dir-enabled = false;
      watch-dir = "/mnt/DISCO/Torrents/Watch";
      watch-dir-enabled = true;

      # Behavior
      trash-original-torrent-files = true;
      umask = "002"; # group-friendly permissions

      # Performance / connectivity
      peer-port = 51413;
      peer-port-random-on-start = false;
      utp-enabled = true;

      # Logging
      message-level = 2;
    };

    # Ensure usable permissions
    downloadDirPermissions = "775";
  };
}
