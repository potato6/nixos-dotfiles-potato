{ ... }: {
  programs.lsd = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      size = {
        large = "dark_yellow";
        none = "grey";
        small = "yellow";
      };
    };
    icons = {
      extension = {
        go = "";
        hs = "";
      };
      filetype = {
        dir = "📂";
        file = "📄";
      };
      name = {
        ".cargo" = "";
        ".trash" = "";
      };
    };
    settings = {
      date = "relative";
      ignore-globs = [ ".git" ".hg" ];
    };
  };
}
