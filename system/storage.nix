{ config, lib, pkgs, modulesPath, ... }:

let
  # 1. Import your existing hardware scan.
  # We do this to "read" what drives were detected during installation.
  hwConfig = import ../hardware-configuration.nix {
    inherit config lib pkgs modulesPath;
  };

  # 2. Iterate over every file system found in hardware-configuration.nix
  fsUpdates = lib.mapAttrs (mountPoint: fsConfig:

    # --- CONDITION 1: BTRFS (Optimized for SSDs) ---
    if fsConfig.fsType == "btrfs" then {
      options = [
        # Compression: Saves space and reduces the amount of data written to the SSD.
        "compress-force=zstd"

        # Write Reduction: Never write "access timestamps" (saves SSD life).
        "noatime"

        # TRIM: Cleans up deleted blocks in the background to prevent SSD slowdowns.
        "discard=async"

        # Performance: Uses the modern "v2" free space map (faster mounting/allocation).
        "space_cache=v2"

        # Buffering: Write metadata to disk every 120s (default 30s).
        # Improves throughput, but you lose 2 mins of work if power fails.
        "commit=120"
      ];
    }

    # --- CONDITION 2: EXT4 (Optimized for Spinning HDDs) ---
    else if fsConfig.fsType == "ext4" then {
      options = [
        # Mechanical Latency: Prevents the drive head from moving just to write 
        # a timestamp when you read a file. Huge speed boost for HDDs.
        "noatime"

        # Buffering: Write to the journal every 60s (default 5s).
        # Allows the HDD to group writes together, reducing fragmentation and noise.
        # Risk: You lose 60s of work on power failure.
        "commit=60"

        # Boot reliability: Large HDDs take time to spin up. 
        # This prevents the boot process from giving up too early.
        "x-systemd.device-timeout=0"
      ];
    }

    # --- CONDITION 3: OTHERS (Fat32, Swap, etc.) ---
    else
      {
        # Do nothing. Return empty set to keep default options.
      }

  ) hwConfig.fileSystems;

in {
  # Import the original hardware config so we have the base definitions
  imports = [ ../hardware-configuration.nix ];

  # Apply our updates. NixOS will merge our new 'options' list 
  # with the basic settings (like 'subvol=home') from the hardware config.
  config = { fileSystems = fsUpdates; };
}
