{ ... }:
{

  networking = {
    nftables.enable = true;
    enableIPv6 = true;

    nameservers = [
      "127.0.0.1"
      "::1"
    ];

    # Hardcode NTP IPs to prevent the DNSSEC "chicken and egg" boot failure
    timeServers = [
      "0.arch.pool.ntp.org"
      "1.arch.pool.ntp.org"
      "2.arch.pool.ntp.org"
      "3.arch.pool.ntp.org"
    ];

    dhcpcd.extraConfig = "nohook resolv.conf";
    useDHCP = true;

    firewall = {
      enable = false;
      allowedTCPPorts = [
        443
        80
        8000 # SillyTavern
      ];
      allowedUDPPorts = [
        123 # NTP
      ];
    };
  };

  services.resolved.enable = false;

}
