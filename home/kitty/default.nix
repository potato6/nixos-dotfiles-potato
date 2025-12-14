{ ... }: {

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd SemiBold";
      size = 13.0;
    };

    settings = {
      sync_to_monitor = "yes";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      background_opacity = 0.8;
      dynamic_background_opacity = true;
      cursor_trail = 1;

      confirm_os_window_close = 0;
      linux_display_server = "auto";
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      enable_audio_bell = false;
      window_padding_width = 4;

      # --- Dainty Dark Color Theme ---
      foreground = "#ffffff";
      background = "#000000";
      selection_foreground = "#000000";
      selection_background = "#b5d5ff";
      cursor = "#bbbbbb";
      url_color = "#0087bd";
      active_border_color = "#6b7394";
      inactive_border_color = "#202746";
      bell_border_color = "#c76b29";
      visual_bell_color = "none"; # String "none" as per theme
      wayland_titlebar_color = "#293256";
      macos_titlebar_color = "#293256";
      active_tab_foreground = "#FFFFFF";
      active_tab_background = "#9C7BD7";
      inactive_tab_foreground = "#FFFFFF";
      inactive_tab_background = "#545B7D";
      tab_bar_background = "#293256";
      tab_bar_margin_color = "none"; # String "none" as per theme
      color0 = "#000000";
      color8 = "#545454";
      color1 = "#ff5555";
      color9 = "#ff5555";
      color2 = "#55ff55";
      color10 = "#55ff55";
      color3 = "#ffff55";
      color11 = "#ffff55";
      color4 = "#5555ff";
      color12 = "#5555ff";
      color5 = "#ff55ff";
      color13 = "#ff55ff";
      color6 = "#55ffff";
      color14 = "#55ffff";
      color7 = "#bbbbbb";
      color15 = "#ffffff";
    };
  };

}

