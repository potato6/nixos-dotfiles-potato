{ ... }: {

  programs. # Yet another nixos helper
  nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos/";
  };

  services = {
    fstrim.enable = true; # Enable TRIM for SSD optimization
    fwupd.enable = true; # No idea what it does
    smartd.enable = true; # Disk monitoring
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true; # Automatically optimize the Nix store
      experimental-features = [ "nix-command" "flakes" ];
      system-features = [
        # Defaults
        "big-parallel"
        "benchmark"
        "kvm"
        "nixos-test"
        # Additional
        "gccarch-x86-64-v3"
        # "gccarch-x86-64-v4"
        # "gccarch-znver4"
      ];
      substituters = [ "https://cache.garnix.io" ];
      trusted-public-keys =
        [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
    };
  };

}
