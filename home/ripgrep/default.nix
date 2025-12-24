{ ... }: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--iglob=!.git"
      "--max-columns-preview"
      "--colors=line:style:bold"
      "--hidden"
      "--smart-case"
      "--pretty"
    ];
  };
}
