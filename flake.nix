{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ucodenix.url = "github:e-tho/ucodenix"; # CPU microcode for amd only

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    nix-gaming-edge = {
      url = "github:powerofthe69/nix-gaming-edge";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  nixConfig = {
    extra-substituters = [
      "https://nix-cache.tokidoki.dev/tokidoki" # gaming edge
      "https://attic.xuyh0120.win/lantian" # cachyos kernel
    ];

    extra-trusted-public-keys = [
      "tokidoki:MD4VWt3kK8Fmz3jkiGoNRJIW31/QAm7l1Dcgz2Xa4hk=" # gaming edge
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" # cachyos kernel
    ];
    allow-import-from-derivation = true;
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ucodenix,
      nix-gaming-edge,
      ...
    }@inputs:
    {
      nixosConfigurations.potato = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # This makes `inputs` available to all modules, including home.nix
        specialArgs = { inherit inputs; };

        modules = [

          nix-gaming-edge.nixosModules.default

          (
            { ... }:
            {
              nixpkgs.overlays = [
                nix-gaming-edge.overlays.default
                nix-gaming-edge.overlays.mesa-git
                nix-gaming-edge.overlays.proton-cachyos
              ];
              drivers.mesa-git.enable = true;
            }
          )

          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [
                # keep your existing shim overlay
                (final: prev: {
                  cachyosKernels = inputs.nix-cachyos-kernel.legacyPackages."${final.stdenv.hostPlatform.system}";
                })
              ];

              boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

              # Binary cache
              nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
              nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
            }
          )

          home-manager.nixosModules.home-manager
          {

            systemd.user.services.niri-flake-polkit.enable = true;
            system.stateVersion = "26.05";

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.potato = {
              imports = [
                ./home
              ];

              home = {
                username = "potato";
                homeDirectory = "/home/potato";
                stateVersion = "26.05";
                shell.enableFishIntegration = true;
              };

              programs.home-manager.enable = true;
            };
          }

          {
            imports = [ ucodenix.nixosModules.default ];
            services.ucodenix.enable = true;
          }

          ./configuration.nix
        ];
      };
    };
}
