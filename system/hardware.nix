{ pkgs, ... }: {

  hardware = {
    cpu.amd.updateMicrocode = true;
    #xone.enable = true;
    amdgpu = {
      initrd.enable = true; # Fixes low res bootscreen
      opencl.enable = false; # vulkan has better performance on Ollama
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ libva ];
    };
  };

  # LACT - GPU overcloking tool
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;
}
