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

    # https://github.com/oh-my-fish/theme-bobthefish
    shellInit = ''
      set -g theme_display_nix yes
      set -g theme_display_screen yes
      set -g theme_display_hostname no
      set -g theme_nerd_fonts yes
      set -g theme_display_jobs_verbose yes
      set -g theme_display_sudo_user yes
      set -g theme_display_git yes
      set -g theme_display_git_dirty yes
      set -g theme_display_git_untracked yes
      set -g theme_display_date no
      set -g theme_title_display_user no

    '';

    shellInitLast = ''
      fastfetch -c $HOME/.config/fastfetch/config.jsonc --logo-type small
      alias ls='lsd'
      alias l='ls -l'
      alias la='ls -a'
      alias lla='ls -la'
      alias lt='ls --tree'   
      alias grep='rg'
      alias yt='yt-dlp'
      alias umu='mangohud gamemoderun umu-run'
    '';
  };

}

