{ pkgs, ... }: {

  boot.kernelModules = [ "ntsync" ];

  environment = {
    sessionVariables = {
      PROTONPATH =
        # temporary jank solution
        "/mnt/DISCO/gayming/_LIBRARIES/proton-cachyos-10.0-20251107-slr-x86_64_v3/proton-cachyos-10.0-20251107-slr-x86_64_v3/";
      WINE_FULLSCREEN_FSR = 1;
      WINE_FULLSCREEN_FSR_STRENGTH =
        1; # 0 is the maximum sharpness, higher values mean less sharpening. 2 is the AMD recommended default

      # https://github.com/CachyOS/proton-cachyos

      PROTON_USE_NTSYNC = 1;
      PROTON_DXVK_GPLASYNC = 1;
      PROTON_ENABLE_WAYLAND = 1;
      PROTON_USE_WOW64 = 1;
      WINE_FULLSCREEN_INTEGER_SCALING = 1;

      ENABLE_VKBASALT = 1;

      WINEDLLOVERRIDES = "winhttp=n,b"; # fixes some modded games

      # https://github.com/Digger1955/dxvk-gplasync-lowlatency/blob/GPLALL-master-2.7.1/dxvk.conf
      DXVK_CONFIG =
        "dxvk.enableAsync=True;dxvk.gplAsyncCache=True;dxvk.framePace=low-latency;dxgi.maxFrameLatency=1;d3d9.maxFrameLatency=1;dxgi.syncInterval=0;d3d9.presentInterval=0;d3d11.maxTessFactor=16;d3d9.samplerAnisotropy=16;d3d11.samplerAnisotropy=16";

    };

    systemPackages = with pkgs; [
      umu-launcher
      goverlay
      mangohud
      vkbasalt
      scanmem
    ];
  };

  programs.gamemode.enable = true;

}
