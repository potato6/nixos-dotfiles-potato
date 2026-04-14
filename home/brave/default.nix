{ pkgs, lib, ... }:
{

  programs.brave = {
    enable = true;
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
      # --- SUBJECTIVE ---
      "--enable-blink-features=MiddleClickAutoscroll"
      "--disable-smooth-scrolling"

      # --- GPU ---
      "--use-gl=angle"
      "--use-angle=gl"
      "--ozone-platform-hint=auto"

      # --- Canvas & Performance ---
      "--enable-gpu-rasterization" # Force GPU to paint web content
      "--enable-oop-rasterization" # Out-of-process rasterization (Critical for heavy sites)
      "--enable-accelerated-2d-canvas" # Hardware acceleration for <canvas> tags
      "--enable-zero-copy" # Reduces RAM->VRAM overhead
      "--enable-native-gpu-memory-buffers" # Bypasses slow IPC for texture sharing

      # --- Feature Flags ---
      "--enable-features=${
        lib.concatStringsSep "," [
          # Downloading
          "ParallelDownloading"

          # Canvas/Rendering Optimization
          "CanvasOopRasterization" # Moves Canvas logic off the main UI thread
          # "RawDraw" # Reduces painting overhead (experimental but fast)
          "UiGpuRasterization" # Renders the browser UI itself on GPU

          # Video/Audio
          "VaapiVideoEncoder"
          "VaapiVideoDecodeLinuxGL"
          "AcceleratedVideoDecodeLinuxZeroCopyGL"
          "ChromeWideEchoCancellation"

          # Wayland/Display
          "WaylandWindowDecorations"
          "WaylandLinuxDrmSyncObjExplicitSync"
        ]
      }"

    ];
  };
}
