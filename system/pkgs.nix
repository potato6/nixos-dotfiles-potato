{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core CLI and file tools
    util-linux
    file
    killall
    uutils-coreutils-noprefix
    fd
    grc
    fzf
    micro

    # Archives and compression
    zip
    unzip
    unrar
    p7zip-rar
    lz4
    xarchiver
    peazip

    # Dev toolchain
    clang
    cargo
    rustc
    nodejs

    # Nix tooling
    cachix
    nixd
    nil
    nix-index
    nix-prefetch

    # Media and graphics
    ffmpeg
    ffmpegthumbnailer
    exiftool
    obs-studio
    qimgv
    playerctl
    sound-theme-freedesktop
    kdePackages.kdenlive
    obs-studio

    # Gaming
    steam.run
    lsfg-vk
    lsfg-vk-ui

    # GPU / Vulkan / ROCm
    lact
    libva-utils
    clinfo
    vulkan-tools
    mesa-demos
    pciutils

    # Desktop integration
    nautilus
    gnome-disk-utility

    # Monitoring and system info
    btop
    htop
    s-tui
    kmon
    nvtopPackages.amd
    duf
    dua
    ipfetch
    cpufetch
    ramfetch
    speedtest-rs
    zenmonitor
    kdePackages.filelight

    # Apps
    qalculate-qt
    keepassxc
    mcomix

    # Misc
    ollama-vulkan
    gemini-cli-bin
    antigravity-fhs

    # Register .exe thumbnailer with Nautilus
    (writeTextFile {
      name = "icoextract-thumbnailer";
      destination = "/share/thumbnailers/exe.thumbnailer";
      text = ''
        [Thumbnailer Entry]
        Exec=${pkgs.icoextract}/bin/exe-thumbnailer %i %o
        MimeType=application/x-ms-dos-executable;application/x-msdownload;application/exe;application/x-exe;application/dos-exe;vms/exe;application/x-wine-extension-exe;application/msi;application/x-msi;application/x-wine-extension-msi;application/x-ms-shortcut;
      '';
    })
    icoextract
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm";
  };

  services.gvfs.enable = true;

  programs = {
    nix-ld.enable = true;
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
