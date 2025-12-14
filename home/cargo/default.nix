{
  programs.cargo = {
    enable = true;
    settings = {
      build = {
        # performance maxxing on the local compiles
        rustflags = [ "-C" "target-cpu=native" ];
      };

      profile.release = {
        opt-level = 3;
        panic = "abort";
        lto = "thin";
      };
    };
  };
}
