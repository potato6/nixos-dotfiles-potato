{ pkgs, ... }:
{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    extraFlags = [
      "--n-gpu-layers"
      "-1"
    ];
  };
}
