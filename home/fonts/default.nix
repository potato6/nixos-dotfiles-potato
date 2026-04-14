{ pkgs, ... }: {
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
  };
  home.packages = [ pkgs.fira pkgs.font-awesome pkgs.roboto ];
}

