{ pkgs, ... }:
{

  hardware = {
    cpu.amd.updateMicrocode = true;
    xone.enable = false; # not necessarybut
    amdgpu = {
      initrd.enable = true; # Fixes low res bootscreen
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ libva ];
    };
  };

  #  Horsing around
  environment.variables = {
    RADV_EXPERIMENTAL = "hic";
  };

  # LACT - GPU overcloking tool
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;
}
