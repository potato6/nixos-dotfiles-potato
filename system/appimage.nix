{ ... }:
{
  programs.appimage = {
    enable = true; # some appimage require me to disable this
    binfmt = true;
  };

}
