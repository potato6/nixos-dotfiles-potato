{ ... }:
{

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

      # Protocol rules
      ipv4_servers = true;
      ipv6_servers = false;
      doh_servers = true;
      dnscrypt_servers = true;
      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

      # Performance
      cache = true;
      http3 = true;
      lb_estimator = true;
      dnscrypt_ephemeral_keys = true;
      tls_disable_session_tickets = true; # Prevents TLS tracking across DoH
      fallback_resolvers = [
        "1.1.1.1:53"
        "9.9.9.9:53"
      ];
    };
  };
}
