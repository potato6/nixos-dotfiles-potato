{ pkgs, lib, ... }:
{

  programs.brave = {
    enable = true;

    package = pkgs.brave.override {
      vulkanSupport = true;
    };

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

      "--enable-blink-features=MiddleClickAutoscroll"
      "--disable-smooth-scrolling"

      # --- GPU ---
      "--disable-gpu-driver-bug-workaround"
      "--use-angle=vulkan"
      "--ignore-gpu-blocklist"
      "--use-gl=angle"
      "--ozone-platform=x11" # vulkan only works with x11 for now

      # --- Feature Flags ---
      "--enable-features=${
        lib.concatStringsSep "," [
          # Downloading
          "ParallelDownloading"

          # Video/Audio
          "TreesInViz"
          "ChromeWideEchoCancellation"
          "AcceleratedVideoEncoder"
          "VaapiOnNvidiaGPUs"
          "VaapiIgnoreDriverChecks"
          "Vulkan"
          "DefaultANGLEVulkan"
          "VulkanFromANGLE"
        ]
      }"
    ];
  };
}
