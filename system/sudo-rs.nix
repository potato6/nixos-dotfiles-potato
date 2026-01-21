{ ... }: {

  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults env_keep += "PATH HOME" 
      '';
    };
  };

}
