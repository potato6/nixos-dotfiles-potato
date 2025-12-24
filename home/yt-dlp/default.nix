{ lib, pkgs, ... }: {

  programs.yt-dlp = {
    enable = true;
    package = pkgs.yt-dlp-light;
    settings = {
      embed-metadata = true;
      sponsorblock-mark = "all";
      downloader = lib.getExe pkgs.aria2;
    };
  };

  home.packages = [ pkgs.aria2 ];

}
