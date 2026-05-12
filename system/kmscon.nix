{ pkgs, ... }:

{
  services.kmscon = {
    enable = true;

    # (uses OpenGLES2)
    hwRender = true;
    fonts = [
      {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      }
    ];
    extraOptions = "--term xterm-256color --xkb-layout=br";
  };
}
