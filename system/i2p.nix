{ ... }:

{
  # # Exposing the nessecary ports in order to interact with i2p from outside the container
  # networking.firewall.allowedTCPPorts = [
  #   7070 # default web interface port
  #   4447 # default socks proxy port
  #   4444 # default http proxy port
  # ];

  # services.i2pd = {
  #   enable = true;
  #   address =
  #     "127.0.0.1"; # you may want to set this to 0.0.0.0 if you are planning to use an ssh tunnel
  #   upnp.enable = false; # security concern
  #   precomputation.elgamal =
  #     true; # Use precomputed ElGamal tables (faster, uses more RAM)
  #   reseed.verify = true; # Verify SU3 signatures on reseed data
  #   proto = {
  #     http.enable = true;
  #     socksProxy.enable = true;
  #     httpProxy.enable = true;
  #   };
  #   addressbook.subscriptions = [
  #     "http://inr.i2p/export/alive-hosts.txt"
  #     "http://i2p-projekt.i2p/hosts.txt"
  #     "http://stats.i2p/cgi-bin/newhosts.txt"
  #   ]; # Default addressbook sources
  # };
}
