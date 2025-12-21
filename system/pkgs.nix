{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System Utilities
    clang
    cargo
    rustc
    gearlever
    lsfg-vk-ui
    lsfg-vk
    unrar
    zip
    p7zip-rar
    lz4
    unzip
    xarchiver
    killall
    cachix
    util-linux
    peazip
    yt-dlp-light
    ffmpeg
    nwg-displays
    exiftool

    # Nix Tools
    nodePackages_latest.nodejs
    nixd
    nil
    s-tui
    nix-index

    # Multimedia
    obs-studio
    playerctl
    sound-theme-freedesktop

    # Gaming
    (steam.override {
      extraPkgs = pkgs: [ SDL2 e2fsprogs nss icu dotnet-runtime ];
    }).run

    # Graphics and Vulkan
    lact
    libva-utils
    clinfo
    vulkan-tools

    # Desktop Environment
    pamixer
    pyprland
    baobab
    qimgv

    # this will Generate icons for windows .exes
    icoextract
    # thumbnailer file manually to ensure it's registered
    (writeTextFile {
      name = "icoextract-thumbnailer";
      destination = "/share/thumbnailers/exe.thumbnailer";
      text = ''
        [Thumbnailer Entry]
        Exec=${pkgs.icoextract}/bin/exe-thumbnailer %i %o
        MimeType=application/x-ms-dos-executable;application/x-msdownload;application/exe;application/x-exe;application/dos-exe;vms/exe;application/x-wine-extension-exe;application/msi;application/x-msi;application/x-wine-extension-msi;application/x-ms-shortcut;
      '';
    })

    # Applications
    qalculate-qt
    keepassxc
    mcomix

    # System Management
    btop
    neofetch
    ipfetch
    cpufetch
    ramfetch
    htop
    btop
    kmon
    speedtest-rs
    nvtopPackages.amd
    duf
    nvd
    nix-prefetch
    file

    # Shell Customization
    fzf
    micro

    # libraries
    uutils-coreutils-noprefix # coreutils rewrite
    lsd # LS replacer
    bat # cat replacer
    fd # find replacer
    ripgrep # grep replacer
    grc # Generic text colouriser
    fzf
  ];

  # USB Automounting
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  programs = {
    nix-ld.enable = true;
    java.enable = true;
    adb.enable = true; # android tools
    # This module configures Hyprland and adds it to your user’s PATH, but does not make certain system-level changes. NixOS users should enable the NixOS module with programs.hyprland.enable, which makes system-level changes such as adding a desktop session entry.
    hyprland = { enable = true; };
    fish.enable = true;
  };

  # https://support.brave.app/hc/en-us/articles/360039248271-Group-Policy
  programs.chromium = {
    enable = true;
    extraOpts = {
      BraveRewardsDisabled = true;
      BraveVPNDisabled = true;
      BraveAIChatEnabled = false;
      BraveNewsDisabled = true;
      BraveTalkDisabled = true;
      BraveP3AEnabled = false;
      BraveStatsPingEnabled = false;
      BraveWebDiscoveryEnabled = false;
      BraveWalletDisabled = false; # NOT DISABLED

      # Chromium in general
      WebRtcIPHandling = "disable_non_proxied_udp";
      AudioCaptureAllowed = false;
      VideoCaptureAllowed = false;
      PasswordManagerEnabled = false;
      PasswordManagerPasskeysEnabled = false;
      PasswordSharingEnabled = false;
      ImportSavedPasswords = false;
      PaymentMethodQueryEnabled = false;
      AutoFillEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      AutofillPredictionSettings = false;
    };
  };
}
