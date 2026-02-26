{ pkgs, ... }:
{

  hardware = {
    cpu.amd.updateMicrocode = true;
    #xone.enable = true;
    amdgpu = {
      initrd.enable = true; # Fixes low res bootscreen
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ libva ];
    };
  };

  # EXPERIMENTAL
  environment.variables = {
    RADV_PERFTEST = "bfloat16,cswave32,dccmsaa,emulate_rt,gewave32,hic,localbos,nggc,nircache,pswave32,rtwave64,sam,transfer_queue";
    AMD_DEBUG = "lowlatencydec,lowlatencyenc,w32ge,w32ps,w32cs,w64ge,w64ps,w64cs,usellvm,nggc,switch_on_eop,dpbb";
  };

  # LACT - GPU overcloking tool
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;
}
