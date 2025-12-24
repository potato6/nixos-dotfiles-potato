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

  nix = {
    optimise.automatic = true;
    settings = {
      warn-dirty = false;
      fallback = true;
      connect-timeout = 1;
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
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      input-fonts.acceptLicense = true;
      joypixels.acceptLicense = true;
    };
  };

}
