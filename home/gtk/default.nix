{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = {
      name = "Yaru-remix-dark";
      package = pkgs.yaru-remix-theme;
    };

    iconTheme = {
      name = "Numix";
      package = pkgs.numix-icon-theme;
    };

    font = {
      name = "Ubuntu Nerd Font Propo Regular";
      package = pkgs.nerd-fonts.ubuntu-sans;
      size = 11;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      "gtk-cursor-theme-size" = 22;
      "gtk-toolbar-style" = "GTK_TOOLBAR_ICONS";
      "gtk-toolbar-icon-size" = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      "gtk-button-images" = 1;
      "gtk-menu-images" = 1;
      "gtk-enable-event-sounds" = 1;
      "gtk-enable-input-feedback-sounds" = 1;
      "gtk-xft-antialias" = 1;
      "gtk-xft-hinting" = 1;
      "gtk-xft-hintstyle" = "hintslight";
      "gtk-xft-rgba" = "rgb";
      "gtk-application-prefer-dark-theme" = 1;
    };
  };

}
