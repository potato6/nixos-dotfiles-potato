{ pkgs, ... }:
{

  boot.kernelModules = [ "ntsync" ];

  environment = {
    sessionVariables = {
      PROTONPATH = "${pkgs.proton-cachyos-x86_64-v3}/share/steam/compatibilitytools.d/proton-cachyos-x86_64-v3";
      WINE_FULLSCREEN_FSR = 1;
      WINE_FULLSCREEN_FSR_STRENGTH = 1; # 0 is the maximum sharpness, higher values mean less sharpening. 2 is the AMD recommended default

      # https://github.com/CachyOS/proton-cachyos

      PROTON_LOCAL_SHADER_CACHE = 1;
      ENABLE_LAYER_MESA_ANTI_LAG = 1;
      PROTON_USE_NTSYNC = 1; # causing crashes(?)
      PROTON_ENABLE_WAYLAND = 1;
      PROTON_USE_WOW64 = 1;
      WINE_FULLSCREEN_INTEGER_SCALING = 1;
      PROTON_NO_WM_DECORATION = 1;
      PROTON_FORCE_LARGE_ADRESS_AWARE = 1;
      STAGING_SHARED_MEMORY = 1;
      PROTON_PRIORITY_HIGH = 1;

      WINEDLLOVERRIDES = "winhttp,d3dcompiler_47=n,b"; # fixes some modded games

      PROTON_DXVK_GPLASYNC = 1; # causing instability on some games
      # https://github.com/Digger1955/dxvk-gplasync-lowlatency/blob/GPLALL-master-2.7.1/dxvk.conf
      DXVK_CONFIG = "dxvk.enableAsync=true;dxvk.gplAsyncCache=True;dxvk.framePace=low-latency;dxvk.lowLatencyAllowCpuFramesOverlap=True";
    };

    systemPackages = with pkgs; [
      umu-launcher
      goverlay
      mangohud
      winetricks
    ];
  };

  programs.gamemode.enable = true;

}
