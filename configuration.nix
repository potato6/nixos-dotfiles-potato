{ lib, ... }:

let

  systemPath = ./system;

  importAllFrom = path:
    let

      dirContents = builtins.readDir path;

      filterNixFiles = name: type:
        type == "regular" && lib.hasSuffix ".nix" name;

      toPath = name: _: path + ("/" + name);

      filesToImport = lib.filterAttrs filterNixFiles dirContents;

    in lib.mapAttrsToList toPath filesToImport;

in {
  # Import hardware scan + all files in ./system
  imports = [ ./hardware-configuration.nix ./cachix.nix ]
    ++ (importAllFrom systemPath);

  system.stateVersion = "25.11"; # Example
}
