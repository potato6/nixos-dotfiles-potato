{ ... }: {

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    extraConfig = ''
      Defaults env_keep += "PATH HOME" 
    '';
  };

}
