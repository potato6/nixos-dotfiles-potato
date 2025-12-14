{ pkgs, lib, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    dictionaries = [ pkgs.hunspellDictsChromium.en_US ];
    extensions = [
      "olnbjpaejebpnokblkepbphhembdicik" # WebGL Fingerprint Defender
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube - Skip Sponsor
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
      "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
      "ldpochfccmkkmhdbclfhpagapcfdljkj" # Decentraleyes
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "bnomihfieiccainjcjblhegjgglakjdd" # 'Improve YouTube!'
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
    ];

    # https://chromium.googlesource.com/chromium/src/+/refs/heads/main/docs/gpu/vaapi.md
    # vulkan is just broken at the time

    commandLineArgs = [
      "--enable-blink-features=MiddleClickAutoscroll"
      "--ignore-gpu-blocklist"
      "--disable-gpu-driver-bug-workaround"
      "--disable-smooth-scrolling"
      "--ozone-platform-hint=auto"
      "--use-gl=angle"
      "--use-angle=gl"
      "--enable-features=${
        lib.concatStringsSep "," [
          "ParallelDownloading"
          "VaapiVideoEncoder"
          "PostQuantumKyber"
          "ChromeWideEchoCancellation"
          "DesktopScreenshots"
          "FluentOverlayScrollbar"
          "FluentScrollbar"
          "EnableTabMuting"
          "GlobalMediaControlsUpdatedUI"
          "WaylandSessionManagement"
          "WaylandLinuxDrmSyncObjExplicitSync"
          "WaylandUIScaling"
          "AcceleratedVideoEncoder"
          "AcceleratedVideoDecodeLinuxGL"
          "AcceleratedVideoDecodeLinuxZeroCopyGL"
          "VaapiIgnoreDriverChecks"
        ]
      }"
    ];
  };
}
