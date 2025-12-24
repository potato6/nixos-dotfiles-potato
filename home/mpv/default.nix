{ pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      player-operation-mode = "pseudo-gui";
      save-position-on-quit = "yes";
      watch-later-directory = "~/.cache/mpv/watch_later";
      ytdl-format = "bestvideo[vcodec=vp9]+bestaudio/bestvideo+bestaudio/best";

      "glsl-shaders" = "~~/shaders/FSRCNNX_x2_16-0-4-1.glsl";
      scale = "catmull_rom";

      "glsl-shader" = "~~/shaders/KrigBilateral.glsl";
      cscale = "mitchell";

      vo = "gpu-next";
      profile = "gpu-hq";
      gpu-api = "vulkan";
      hwdec = "auto";
      video-sync = "display-resample";
      tscale = "mitchell";
      interpolation = true;

      osd-font-size = 17;
      keep-open = true;

      vulkan-async-compute = true;
      vulkan-async-transfer = true;
      vulkan-queue-count = 1;
      vd-lavc-dr = true;

    };

    scripts = with pkgs.mpvScripts; [
      mpris
      youtube-upnext
      uosc
      memo
      reload
      thumbfast
      sponsorblock
      quality-menu
    ];

    bindings = {
      ESC = "cycle fullscreen";
      SPACE = "cycle pause";
      IDEOGRAPHIC_SPACE = "cycle pause";
      M = "cycle mute";
      ENTER = "show-progress";

      l = ''
        cycle-values loop-file yes no ; show-text "''${?=loop-file==inf:Looping enabled (file)}''${?=loop-file==no:Looping disabled (file)}"'';
      L = ''
        cycle-values loop-playlist yes no ; show-text "''${?=loop-playlist==inf:Looping enabled}''${?=loop-playlist==no:Looping disabled}"'';
      "CTRL+l" = "ab-loop";

    };

  };
}
