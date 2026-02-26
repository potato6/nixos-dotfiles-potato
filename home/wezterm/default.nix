{ ... }:
# this is to fix a demonic issue where the file managers dont find wezterm
{
  xdg.desktopEntries = {
    helix = {
      name = "Helix";
      genericName = "Text Editor";
      comment = "Post-modern modal text editor";
      # 'wezterm start --' ensures we launch the terminal, then 'hx' opens the file (%F)
      exec = "wezterm start -- hx %F";
      icon = "helix";
      terminal = false; # Set to false because we are calling wezterm manually
      categories = [
        "Utility"
        "TextEditor"
        "Development"
      ];
      mimeType = [
        "text/plain"
        "text/markdown"
        "application/x-shellscript"
        "text/x-yaml"
        "text/x-python"
        "text/x-rust"
        "application/json"
        "application/toml"
      ];
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''

      local wezterm = require("wezterm")
      local act = wezterm.action

      local config = {
      	initial_cols = 120,
      	initial_rows = 28,
      	font = wezterm.font("JetBrains Mono", { weight = "Medium" }),
      	font_size = 13,
      	color_scheme = "Ayu Dark",
      	window_background_opacity = 0.8,
      	front_end = "WebGpu",
      	quote_dropped_files = "SpacesOnly",
      	webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1],
      	enable_tab_bar = true,
      	enable_scroll_bar = true,

      	-- === GUI CONTRAST SETTINGS ===
      	colors = {
      		foreground = "#FFFFFF",
      		-- Make the background of the tab bar distinct (e.g., solid black)
      		tab_bar = {
      			background = "#000000",

      			-- The active tab needs high contrast
      			active_tab = {
      				bg_color = "#E6B450", -- Bright Ayu Yellow/Orange
      				fg_color = "#000000", -- Black text
      				intensity = "Bold",
      			},

      			-- Inactive tabs should recede
      			inactive_tab = {
      				bg_color = "#1F2430", -- Darker gray/blue
      				fg_color = "#808080", -- Dimmed text
      			},

      			-- The new tab button
      			new_tab = {
      				bg_color = "#101010",
      				fg_color = "#C0C0C0",
      			},
      		},

      		-- Optional: Make the split pane borders very visible
      		split = "#E6B450",
      	},

      	-- Make the tab bar easier to see by removing its transparency
      	-- (window_background_opacity affects the terminal, this keeps the bar solid)
      	window_frame = {
      		active_titlebar_bg = "#000000",
      		inactive_titlebar_bg = "#101010",
      	},

      	keys = {
      		-- New: ALT + Q to close the current tab
      		{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },

      		{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
      		{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
      		{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
      	},
      }

      -- Loop to create Alt+1 through Alt+9
      for i = 1, 9 do
      	table.insert(config.keys, {
      		key = tostring(i),
      		mods = "ALT",
      		action = wezterm.action_callback(function(win, pane)
      			local tabs = win:mux_window():tabs()
      			if (i - 1) < #tabs then
      				win:perform_action(act.ActivateTab(i - 1), pane)
      			else
      				win:perform_action(act.SpawnTab("DefaultDomain"), pane)
      			end
      		end),
      	})
      end

      return config


                  
    '';
  };
}
