{ ... }:
{

  networking = {
    nftables.enable = true;
    enableIPv6 = true;
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    dhcpcd.extraConfig = "nohook resolv.conf"; # Stop DHCP modifying resolv.conf
    useDHCP = true; # Enable DHCP for all interfaces
    firewall = {
      enable = false;
      allowedTCPPorts = [
        443 # HTTPS
        80 # HTTP
      ];
      allowedUDPPorts = [
        123 # NTP
      ];
    };
  };

  services.resolved.enable = false; # dnscrypt below so disable this skunk

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      listen_addresses = [
        "127.0.0.1:53"
        "[::1]:53"
      ];
      server_names = [
        "nextdns-ultralow"
        "mullvad-doh"
        "adguard-dns-unfiltered-doh"
        "controld-uncensored"
        "quad9-doh6-port443-nofilter-pri"
      ];
      ipv4_servers = true;
      ipv6_servers = true;
      require_dnssec = true;
      cache = true;
      doh_servers = true;
      dnscrypt_servers = true;
      require_nolog = true;
      require_nofilter = true;
      http3 = true;
      lb_estimator = true;
    };
  };
}
