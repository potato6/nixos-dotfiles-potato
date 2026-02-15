{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = { package = pkgs.adwaita-qt; };
  };

  home.packages = [ pkgs.adwaita-qt6 ];

  # home.file.".config/qt5ct" = { source = ./qt5ct; };

  # home.file.".config/qt6ct" = { source = ./qt6ct; };
}
