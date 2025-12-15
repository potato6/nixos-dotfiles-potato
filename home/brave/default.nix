{ pkgs, lib, ... }: {

  programs.brave = {
    enable = true;
    package = pkgs.brave;
    dictionaries = [ pkgs.hunspellDictsChromium.en_US ];

    extensions = [
      "olnbjpaejebpnokblkepbphhembdicik" # webgl fingerprint defender
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock for youtube
      "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislike
      "oboonakemofpalcgghocfoadofidjkkk" # keepassxc-browser
      "ldpochfccmkkmhdbclfhpagapcfdljkj" # decentraleyes
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "bnomihfieiccainjcjblhegjgglakjdd" # improve youtube!
      "jinjaccalgkegednnccohejagnlnfdag" # violentmonkey
      "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
    ];

    # https://chromium.googlesource.com/chromium/src/+/refs/heads/main/docs/gpu/vaapi.md
    # vulkan is just broken at the time

    commandLineArgs = [
      "--disable-features=BraveAIChat,BraveRewards,BraveVPN,BraveNews"
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
