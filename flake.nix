{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ucodenix.url = "github:e-tho/ucodenix"; # CPU microcode for amd only

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/";

    proton-cachyos.url = "github:powerofthe69/proton-cachyos-nix";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };

  outputs = { dankMaterialShell, nixpkgs, proton-cachyos, home-manager, ucodenix
    , ... }@inputs: {
      nixosConfigurations.potato = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # This makes `inputs` available to all modules, including home.nix
        specialArgs = { inherit inputs; };

        modules = [

          { nixpkgs.overlays = [ proton-cachyos.overlays.default ]; }

          ({ pkgs, ... }: {
            nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.default ];
            boot.kernelPackages =
              pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
            # Binary cache
            nix.settings.substituters =
              [ "https://attic.xuyh0120.win/lantian" ];
            nix.settings.trusted-public-keys =
              [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.potato = {
              imports = [
                ./home.nix
                ./home
                dankMaterialShell.homeModules.dank-material-shell
              ];
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
