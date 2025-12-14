{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      useEmbeddedBitmaps = true;
      hinting.autohint = true;
    };
    packages = with pkgs; [
      nerd-fonts.ubuntu
      noto-fonts
      fira-code
      noto-fonts-cjk-sans
      jetbrains-mono
      font-awesome
      nerd-fonts.jetbrains-mono
      roboto
      helvetica-neue-lt-std
      corefonts
      fira
      noto-fonts-color-emoji
      fira-sans
      font-awesome # Provides Font Awesome 6 Free
      font-awesome_5 # Provides Font Awesome 5 Free
    ];
  };

}
