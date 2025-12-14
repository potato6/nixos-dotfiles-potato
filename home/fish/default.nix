{ pkgs, ... }: {

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "bobthefish";
        src = pkgs.fishPlugins.bobthefish.src;
      }
    ];
    interactiveShellInit = ''
      if not set -q FASTFETCH_RUN
        fastfetch -c $HOME/.config/fastfetch/config.jsonc --logo-type small
        set -g FASTFETCH_RUN 1
      end
      alias ls='lsd'
      alias l='ls -l'
      alias la='ls -a'
      alias lla='ls -la'
      alias lt='ls --tree'   
      alias grep='rg'
      alias yt='yt-dlp'
      alias umu='mangohud gamemoderun umu-run'
      # bobthefish settings
      set -g theme_powerline_fonts yes
      set -g theme_nerd_fonts yes
      set -g theme_display_git yes
      set -g theme_display_git_dirty yes
      set -g theme_display_git_untracked yes
      set -g theme_display_git_stashed_verbose yes
      set -g theme_display_git_master_branch yes
      set -g theme_display_nix yes
      set -g theme_display_vi yes
      set -g theme_display_date no
      set -g theme_title_display_path yes
      set -g theme_display_hostname no
      set -g theme_display_sudo_user yes

      function on_command_start --on-event fish_preexec
          set -g CMD_DURATION_START (date +%s)
      end

    '';
  };
}

