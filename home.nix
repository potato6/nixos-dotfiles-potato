{ ... }:

{
  home.username = "potato";
  home.homeDirectory = "/home/potato";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # 'Temporary' fix until thunar finds kitty terminal

  home.file.".config/xfce4/helpers.rc".text = ''
    WebBrowser=brave
    Editor=kitty hx
    TerminalEmulator=kitty
    TerminalEmulatorDismissed=true
  '';
}
