{ ... }: {

  programs. # Yet another nixos helper
  nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos/";
  };

  services = {
    fstrim.enable = true; # Enable TRIM for SSD optimization
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
      extra-substituters = [ "https://nix-community.cachix.org" ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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
