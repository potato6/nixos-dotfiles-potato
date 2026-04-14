{ ... }: {
  programs = {
    git = {
      enable = true;
      settings = { safe = { directory = "/etc/nixos"; }; };
    };

    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
      settings = {
        changeHunkIndicators = true;
        markEmptyLines = true;
        stripLeadingSymbols = true;
        useUnicodeRuler = true;
      };
    };
  };

}
