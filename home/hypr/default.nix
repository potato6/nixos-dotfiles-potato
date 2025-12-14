{ pkgs, config, ... }: {

  imports =
    [ ./hyprpolkitagent.nix ./pyprland.nix ./hypridle.nix ./hyprshot.nix ];

  # Source wallpapaer from /etc/nixos/wallpapers
  xdg.configFile."hypr/wallpaper".source = ./wallpapers;

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };

    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      pkgs.hyprlandPlugins.hyprfocus
      # ...
    ];

    extraConfig = ''
       plugin:hyprfocus {
        fade_opacity = 0.97
        }
       plugin:dynamic-cursors {
        mode = stretch
        threshold = 2
        tilt {
          function = negative_quadratic
        }
      }
    '';

    settings = {
      "ecosystem:enforce_permissions" = true;
      permission = [
        "${pkgs.hyprshot}/bin/hyprshot, screencopy, allow"
        "${pkgs.hyprpicker}/bin/hyprpicker, screencopy, allow"
        "${pkgs.grim}/bin/grim, screencopy, allow"
        "${pkgs.hyprlandPlugins.hyprexpo}/lib/libhyprexpo.so, plugin, allow"
        "${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so, plugin, allow"
        "${pkgs.hyprlandPlugins.hyprfocus}/lib/libhyprfocus.so, plugin, allow"
        "${pkgs.hyprlandPlugins.hyprscrolling}/lib/libhyprscrolling.so, plugin, allow"
      ];

      # Source the monitors.conf file
      # use monitor config with Nwg-display

      source = [ "~/.config/hypr/monitors.conf" ];

      # Variables
      "$terminal" = "kitty";
      "$mainMod" = "SUPER";
      "$menu" = "rofi -show drun -show-icons";

      "$scriptsDir" = "${config.xdg.configHome}/hypr/scripts";
      "$UserScripts" = "${config.xdg.configHome}/hypr/UserScripts";

      # REMIND TO USE NWG-DISPLAY INSTEAD OF HARDCODING HERE
      #monitor = [
      #  "DP-2,preferred,1366x306,1.0"
      #  "DP-3,preferred,2806x103,1.0"
      #  "DP-3,transform,3"
      #];

      #startup applications
      "exec-once" = [ "pypr &" ];

      # environment Variables
      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,22"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,22"
        "WAYLAND_DISPLAY,wayland-0"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,gtk3"
        "QT_QPA_PLATFORMTHEME_QT6,gtk3"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GTK_CSD,0"
        "TERM,kitty"
        "GDK_SCALE,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "SDL_VIDEODRIVER,wayland"
        "NIXOS_OZONE_WL,1"
      ];

      # General Settings
      general = {
        gaps_in = 3;
        gaps_out = 2;
        border_size = 3;
        "col.active_border" = "rgba(00ffffff) rgba(000080ff) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = true;
        layout = "dwindle";
      };

      # Decoration Settings
      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        dim_inactive = false;
        dim_strength = 0.1;
        dim_special = 0.8;
        dim_around = 0.4;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          ignore_opacity = true;
          new_optimizations = true;
          special = false;
          popups = true;
          xray = false;
          noise = 2.0e-2;
          contrast = 1.1;
          vibrancy = 0.2;
          vibrancy_darkness = 0.3;
        };

        shadow = {
          enabled = true;
          range = 30;
          render_power = 5;
          offset = "0 5";
          color = "rgba(00000070)";
        };
      };

      # XWayland Settings
      xwayland = {
        enabled = false;
        force_zero_scaling = true;
        use_nearest_neighbor = true;
        create_abstract_socket = true;
      };

      # Render Settings
      render = {
        direct_scanout = 2;
        expand_undersized_textures = true;
        new_render_scheduling = true;
      };

      # Cursor Settings
      cursor = {
        enable_hyprcursor = true;
        warp_on_change_workspace = true;
        no_warps = false;
        inactive_timeout = 10;
        sync_gsettings_theme = true;
      };

      # Animations
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 3.5, easeOutExpo, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
      # Dwindle Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master Layout
      master = { new_status = "master"; };

      # Miscellaneous Settings
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
        vrr = 3;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
        focus_on_activate = true;
        initial_workspace_tracking = 2;
        middle_click_paste = false;
        layers_hog_keyboard_focus = true;
        font_family = "Roboto";
      };

      # Input Settings
      input = {
        kb_layout = "br";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        repeat_rate = 50;
        repeat_delay = 300;
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
      };

      # Regular Keybindings
      bind = [

        # Hyprspace
        "$mainMod, apostrophe, exec, dms ipc call hypr toggleOverview"

        # Basic Actions
        "$mainMod, Return, exec, $terminal" # Launch terminal
        "$mainMod, Q, killactive," # Close active window
        "$mainMod SHIFT, Q, exec, $scriptsDir/KillActiveProcess.sh" # Kill active process with script
        "$mainMod, T, exec, thunar" # Launch file manager
        "$mainMod, F, togglefloating," # Toggle floating mode
        "$mainMod SHIFT, F, fullscreen" # Toggle fullscreen
        "$mainMod, D, exec, dms ipc call spotlight toggle" # Launch application menu

        # Screenshot Bindings
        ", Print, exec, hyprshot -m window -m active -o /mnt/DISCO/Pictures/screenshots/ & ~/.config/hypr/scripts/Sounds.sh --screenshot" # Screenshot active window
        "$mainMod, Print, exec, hyprshot -m region -z -o /mnt/DISCO/Pictures/screenshots/ && ~/.config/hypr/scripts/Sounds.sh --screenshot" # screenshot region

        # Refresh broken waybar
        "$mainMod SHIFT, R, exec, systemctl restart --user waybar.service"

        # pyprland
        "$mainMod SHIFT, Return, exec, pypr toggle term" # Dropdown terminal
        "$mainMod, Z, exec, pypr zoom" # Toggle Zoom

        # Application Launchers

        # Launch Brave browser
        "$mainMod, I, exec, brave"

        # Launch Discord

        "$mainMod, V, exec, vesktop --disable-smooth-scrolling"

        # Layout Controls (Dwindle)
        "$mainMod, J, togglesplit," # Toggle split (dwindle)
        "$mainMod SHIFT, I, togglesplit" # Alternative toggle split

        # Layout Controls (Master)
        "$mainMod CTRL, D, layoutmsg, removemaster" # Remove master window
        "$mainMod, I, layoutmsg, addmaster" # Add master window
        "$mainMod, J, layoutmsg, cyclenext" # Cycle to next window
        "$mainMod, K, layoutmsg, cycleprev" # Cycle to previous window
        "$mainMod CTRL, Return, layoutmsg, swapwithmaster" # Swap with master

        # Group Controls
        "$mainMod, G, togglegroup" # Toggle window group
        "$mainMod CTRL, tab, changegroupactive" # Change active window in group

        # Window Cycling
        "ALT, tab, cyclenext" # Cycle to next window
        "ALT, tab, bringactivetotop" # Bring active window to top

        # Window Movement
        "$mainMod CTRL, left, movewindow, l" # Move window left
        "$mainMod CTRL, right, movewindow, r" # Move window right
        "$mainMod CTRL, up, movewindow, u" # Move window up
        "$mainMod CTRL, down, movewindow, d" # Move window down

        # Focus Movement
        "$mainMod, left, movefocus, l" # Focus left
        "$mainMod, right, movefocus, r" # Focus right
        "$mainMod, up, movefocus, u" # Focus up
        "$mainMod, down, movefocus, d" # Focus down

        # Workspace Navigation
        "$mainMod, tab, workspace, m+1" # Next workspace
        "$mainMod SHIFT, tab, workspace, m-1" # Previous workspace
        "$mainMod, period, workspace, e+1" # Scroll workspaces forward
        "$mainMod, comma, workspace, e-1" # Scroll workspaces backward
        "$mainMod, mouse_down, workspace, e+1" # Scroll down to next workspace
        "$mainMod, mouse_up, workspace, e-1" # Scroll up to previous workspace

        # Switch to Workspaces (1-10)
        "$mainMod, code:10, workspace, 1"
        "$mainMod, code:11, workspace, 2"
        "$mainMod, code:12, workspace, 3"
        "$mainMod, code:13, workspace, 4"
        "$mainMod, code:14, workspace, 5"
        "$mainMod, code:15, workspace, 6"
        "$mainMod, code:16, workspace, 7"
        "$mainMod, code:17, workspace, 8"
        "$mainMod, code:18, workspace, 9"
        "$mainMod, code:19, workspace, 10"

        # Move Window to Workspaces (1-10)
        "$mainMod SHIFT, code:10, movetoworkspace, 1"
        "$mainMod SHIFT, code:11, movetoworkspace, 2"
        "$mainMod SHIFT, code:12, movetoworkspace, 3"
        "$mainMod SHIFT, code:13, movetoworkspace, 4"
        "$mainMod SHIFT, code:14, movetoworkspace, 5"
        "$mainMod SHIFT, code:15, movetoworkspace, 6"
        "$mainMod SHIFT, code:16, movetoworkspace, 7"
        "$mainMod SHIFT, code:17, movetoworkspace, 8"
        "$mainMod SHIFT, code:18, movetoworkspace, 9"
        "$mainMod SHIFT, code:19, movetoworkspace, 10"
        "$mainMod SHIFT, bracketleft, movetoworkspace, -1" # Previous workspace
        "$mainMod SHIFT, bracketright, movetoworkspace, +1" # Next workspace

        # Move Window to Workspaces Silently (1-10)
        "$mainMod CTRL, code:10, movetoworkspacesilent, 1"
        "$mainMod CTRL, code:11, movetoworkspacesilent, 2"
        "$mainMod CTRL, code:12, movetoworkspacesilent, 3"
        "$mainMod CTRL, code:13, movetoworkspacesilent, 4"
        "$mainMod CTRL, code:14, movetoworkspacesilent, 5"
        "$mainMod CTRL, code:15, movetoworkspacesilent, 6"
        "$mainMod CTRL, code:16, movetoworkspacesilent, 7"
        "$mainMod CTRL, code:17, movetoworkspacesilent, 8"
        "$mainMod CTRL, code:18, movetoworkspacesilent, 9"
        "$mainMod CTRL, code:19, movetoworkspacesilent, 10"
        "$mainMod CTRL, bracketleft, movetoworkspacesilent, -1" # Previous silently
        "$mainMod CTRL, bracketright, movetoworkspacesilent, +1" # Next silently

        # Miscellaneous
        "$mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat" # All windows float
        "$mainMod SHIFT, C, exec, dms ipc call clipboard toggle"
      ];

      # Lock Bindings (bindl)
      bindl = [
        ", xf86AudioMicMute, exec, $scriptsDir/Volume.sh --toggle-mic" # Toggle mic mute
        ", xf86audiomute, exec, $scriptsDir/Volume.sh --toggle" # Toggle audio mute
        ", xf86Sleep, exec, systemctl suspend" # Suspend system
        ", xf86AudioPlayPause, exec, $scriptsDir/MediaCtrl.sh --pause" # Play/pause media
        ", xf86AudioPause, exec, $scriptsDir/MediaCtrl.sh --pause" # Pause media
        ", xf86AudioPlay, exec, $scriptsDir/MediaCtrl.sh --pause" # Play media
        ", xf86AudioNext, exec, $scriptsDir/MediaCtrl.sh --nxt" # Next track
        ", xf86AudioPrev, exec, $scriptsDir/MediaCtrl.sh --prv" # Previous track
        ", xf86audiostop, exec, $scriptsDir/MediaCtrl.sh --stop" # Stop media
      ];

      # Edge-Triggered Bindings (bindel)
      bindel = [
        ", xf86audioraisevolume, exec, $scriptsDir/Volume.sh --inc" # Increase volume
        ", xf86audiolowervolume, exec, $scriptsDir/Volume.sh --dec" # Decrease volume
      ];

      # Edge-Triggered Bindings with Lock (binde)
      binde = [
        "$mainMod SHIFT, left, resizeactive,-50 0" # Resize window left
        "$mainMod SHIFT, right, resizeactive,50 0" # Resize window right
        "$mainMod SHIFT, up, resizeactive,0 -50" # Resize window up
        "$mainMod SHIFT, down, resizeactive,0 50" # Resize window down
      ];

      # Mouse Bindings (bindm)
      bindm = [
        "$mainMod, mouse:272, movewindow" # Move window with left click
        "$mainMod, mouse:273, resizewindow" # Resize window with right click
      ];

      workspace = [
        #Smart Gaps

        "w[tv1]s[false], gapsout:0, gapsin:0"
        "f[1]s[false], gapsout:0, gapsin:0"

      ];

      windowrule = [

        "immediate,class:*gamescope"
        "immediate,class:^(steam_app_default)$"
        "immediate,initialClass:^(steam_app_default)$"
        "immediate,xdgTag: proton-game"

        "bordersize 0, floating:0, onworkspace:w[tv1]s[false]"
        "rounding 0, floating:0, onworkspace:w[tv1]s[false]"
        "bordersize 0, floating:0, onworkspace:f[1]s[false]"
        "rounding 0, floating:0, onworkspace:f[1]s[false]"

        # Float specific dialogs (originally windowrule)
        "float, title:^(Open File)(.*)$"
        "float, title:^(Select a File)(.*)$"
        "float, title:^(Choose wallpaper)(.*)$"
        "float, title:^(Open Folder)(.*)$"
        "float, title:^(Save As)(.*)$"
        "float, title:^(Library)(.*)$"
        "float, title:^(File Upload)(.*)$"
        "float, title:^(.* wants to save)(.*)$"
        "float, title:^(Friends List)(.*)$"
        "float, title:^(Steam Settings)(.*)$"
        "float, title:^(Create or select new Steam library folder)(.*)$"
        "float, title:^(Save File)$"
        "float, title:^(.* wants to open)(.*)$"
        "float, title:^(Select Folder)"
      ];

      windowrulev2 = [
        # Ignore maximize requests from apps
        "suppressevent maximize, class:.*"

        # Fix dragging issues with XWayland
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"

        # Center specific windows
        "center, class:([Tt]hunar), title:(File Operation Progress)"
        "center, class:([Tt]hunar), title:(Confirm to replace files)"
        "center, title:^(ROG Control)$"
        "center, title:^(Keybindings)$"

        # Move specific windows to positions
        "move 72% 7%, title:^(Picture-in-Picture)$"

        # Idle inhibition for fullscreen apps
        "idleinhibit fullscreen, class:^(.*)$"
        "idleinhibit fullscreen, fullscreen:1"
        "idleinhibit, class: gamescope"
        "idleinhibit, class: onion.torzu_emu.torzu"
        "idleinhibit, xdgTag: proton-game"

        # Float specific windows
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float, class:([Zz]oom|onedriver|onedriver-launcher)$"
        "float, class:([Tt]hunar), title:(File Operation Progress)"
        "float, class:([Tt]hunar), title:(Confirm to replace files)"
        "float, class:(xdg-desktop-portal-gtk)"
        "float, class:(org.gnome.Calculator), title:(Calculator)"
        "float, class:(codium|codium-url-handler|VSCodium|code-oss), title:(Add Folder to Workspace)"
        "float, class:(electron), title:(Add Folder to Workspace)"
        "float, class:^([Rr]ofi)$"
        "float, class:^(eog|org.gnome.Loupe)$"
        "float, class:^(eom|org.mate.eom)$"
        "float, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "float, class:^(nwg-look|qt5ct|qt6ct)$"
        "float, class:^(mpv|com.github.rafostar.Clapper)$"
        "float, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "float, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
        "float, class:^([Yy]ad)$"
        "float, class:^(wihotspot(-gui)?)$"
        "float, class:^(evince)$"
        "float, class:^(file-roller|org.gnome.FileRoller)$"
        "float, class:^([Bb]aobab|org.gnome.[Bb]aobab)$"
        "float, title:(Kvantum Manager)"
        "float, class:^([Qq]alculate-gtk)$"
        "float, class:^([Ff]erdium)$"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(ROG Control)$"
        "float, title:^(hyprgui)$"
        "float, title:^(gamescope)$"
        "float, class:^(gamescope)$"
        "float, class:^(viewnior)$"
        "float, class:^(lximage-qt)$"
        "float, class:^(kitty-dropterm)$"
        "float, class:^(feh)$"
        "float, class:^(Tk)$"
        "float, class:^(zenity)$"
        "float, class:^(imv)$"
        "float, class:^(swayimg)$"
        "float, class:^(io.github.Qalculate.qalculate-qt)$"
        "float, class:^(nwg-displays)$"
        "float, class: qimgv"
        "float, class: org.quickshell"
        "float, xdgTag: proton-game"
        "persistentsize, xdgTag: proton-game"
        "noborder, xdgTag: proton-game"

        # Set sizes for specific windows
        "size 70% 70%, class:^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"
        "size 70% 70%, class:^(xdg-desktop-portal-gtk)$"
        "size 60% 70%, title:(Kvantum Manager)"
        "size 60% 70%, class:^(qt6ct)$"
        "size 70% 70%, class:^(evince|wihotspot(-gui)?)$"
        "size 60% 70%, class:^(file-roller|org.gnome.FileRoller)$"
        "size 60% 70%, class:^([Ww]hatsapp-for-linux)$"
        "size 60% 70%, class:^([Ff]erdium)$"
        "size 60% 70%, title:^(ROG Control)$"
        "size 60% 70%, title:^(hyprgui)$"
        "size 80% 80%, class:^(viewnior)$"

        # No shadow for tiled windows
        "noshadow, floating:0"

        # Pin specific windows
        "pin, title:^(Picture-in-Picture)$"

        # Extras
        "keepaspectratio, title:^(Picture-in-Picture)$"

        "opacity 0.5 0.5,class:^(tofi)$"
      ];

      # Layer Rules
      layerrule = [
        # No animations for specific layers
        "noanim, walker"
        "noanim, selection"
        "noanim, overview"
        "noanim, anyrun"
        "noanim, indicator.*"
        "noanim, osk"
        "noanim, hyprpicker"
        "noanim, hyprshot"

        # Blur
        "blur, quickshell"
        "blur, dms:bar"
        "blur, dms:dash"
        "blur, dms:clipboard"
        "blur, dms:app-launcher"
        "blur, dms:control-center"
        "blur, dms:spotlight"
        "blur, dms:process-list-popout"
        "blur, dms:notification-popup"
        "blur, dms:notification-center-popout"
      ];
    };
  };

}

