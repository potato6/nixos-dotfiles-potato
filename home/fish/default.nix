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

      function on_command_start --on-event fish_preexec
          set -g CMD_DURATION_START (date +%s)
      end

    '';
  };
}

