{ pkgs, ... }: {

  home.file.".config/mpv/shaders" = {
    source = ./shaders;
    recursive = true;
  };

  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    config = {

      glsl-shaders-append =
        "~/.config/mpv/shaders/FSRCNNX_x2_16-0-4-1_enhance.glsl,~/.config/mpv/shaders/KrigBilateral.glsl";

      player-operation-mode = "pseudo-gui";
      save-position-on-quit = "yes";
      watch-later-directory = "~/.cache/mpv/watch_later";
      ytdl-format = "bestvideo+bestaudio/bestvideo+bestaudio/best";

      scale = "ewa_lanczos";
      scale-blur = "0.981251";
      dscale = "mitchell";
      cscale = "mitchell";

      tscale = "box";
      tscale-window = "sphinx";
      tscale-radius = "1.01";
      tscale-clamp = "0.0";

      deband = false;
      deband-iterations = 4;
      deband-threshold = 50;
      deband-range = 16;
      deband-grain = 24;

      vo = "gpu"; # gpu-next is problematic at the moment
      gpu-api = "vulkan";
      hwdec = "auto";
      video-sync = "display-resample";
      interpolation = true;
      osd-font-size = 17;
      keep-open = true;
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
