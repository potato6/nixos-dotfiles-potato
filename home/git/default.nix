{ ... }: {
  programs.git = {
    enable = true;
    settings = { safe = { directory = "/etc/nixos"; }; };
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      changeHunkIndicators = true;
      markEmptyLines = true;
    };
  };

}
