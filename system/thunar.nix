{ pkgs, ... }: {

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      exo
      tumbler
      thunar-vcs-plugin
      thunar-media-tags-plugin
    ];
  };

}
