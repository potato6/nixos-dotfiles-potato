{ ... }: {
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
      	window_background_opacity = 0.9,
      	front_end = "WebGpu",
      	webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1],
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

