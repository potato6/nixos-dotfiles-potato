{ ... }:
{

  programs.cargo = {
    enable = true;
    settings = {

      build = {
        rustflags = [
          "-C"
          "target-cpu=native"
        ];
      };

      profile.release = {
        opt-level = 3;
        lto = "thin";
      };

    };
  };
}
