{ ... }: {

  programs.gnupg.agent = {
    enable = true; # Enables GnuPG agent
    enableSSHSupport = false;
  };

}
