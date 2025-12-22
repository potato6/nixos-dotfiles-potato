{ ... }: {

  services.resolved.enable = false; # dnscrypt below so disable this skunk

  networking = {
    nftables.enable = true;
    nameservers = [ "127.0.0.1" "::1" ];
    resolvconf.enable = false; # Prevent /etc/resolv.conf overwrites
    dhcpcd.extraConfig = "nohook resolv.conf"; # Stop DHCP modifying resolv.conf
    useDHCP = true; # Enable DHCP for all interfaces
    firewall = {
      enable = true;
      allowedTCPPorts = [
        443 # HTTPS
        # 80 # HTTP
      ];
      allowedUDPPorts = [
        123 # NTP
      ];
    };
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
      server_names = [
        "nextdns-ultralow"
        "mullvad-doh"
        "cs-brazil6"
        "adguard-dns-unfiltered-doh-ipv6"
        "controld-uncensored"
        "quad9-doh-ip6-port443-nofilter-pri"
      ];
      ipv6_servers = true;
      require_dnssec = true;
      cache = true;
      doh_servers = true;
      dnscrypt_servers = true;
      require_nolog = true;
      require_nofilter = true;
      http3 = true;
      lb_strategy = "fastest";
      lb_estimator = true;
      bootstrap_resolvers = [ "1.1.1.1:53" "8.8.8.8:53" "9.9.9.9:53" ];
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key =
          "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
    };
  };

}
