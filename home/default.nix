{ lib, ... }:

let
  # The path to the current directory (./home)
  folder = ./.;

  # The Recursive Function
  scanPaths = path:
    let
      readDir = builtins.readDir path;

      process = name: type:
        let absPath = path + "/${name}";
        in if type == "directory" then
        # If dir has default.nix, import the dir (let it handle itself)
          if builtins.pathExists (absPath + "/default.nix") then
            [
              absPath
            ]
            # Otherwise recurse

          else
            scanPaths absPath
            # Import .nix files, ignoring this specific file (default.nix)
        else if type == "regular" && lib.hasSuffix ".nix" name && name
        != "default.nix" then
          [ absPath ]
        else
          [ ];
    in lib.concatLists (lib.mapAttrsToList process readDir);
in {
  # This file simply outputs an import list
  imports = scanPaths folder;
}
