{ pkgs, ... }: {
  # Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # Use a single-line, double-quoted string to avoid nested single-quote issues
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd "hyprland"'';
      };
      initial_session = {
        command = "hyprland";
        user = "potato";
      };
    };
  };

}
