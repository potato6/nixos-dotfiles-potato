{ ... }:

{
  config = {
    fileSystems."/mnt/DISCO" = {
      device = "UUID=5c120c58-ffea-4ad5-9a59-eeb8ed2b9239";
      fsType = "ext4";
      options = [ "defaults" "nofail" "x-gvfs-show" ];
    };
  };
}
