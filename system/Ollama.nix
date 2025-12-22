{ pkgs, ... }: {
  services = {
    ollama = {
      enable = true; # Enable Ollama service
      package = pkgs.ollama-vulkan; # pkgs.ollama ,-vulkan,-rocm,-cuda,-cpu`.
      port = 11434; # HTTP API port
      host = "127.0.0.1"; # Bind address

      #models = "/mnt/DISCO/AI_CHAT_BOT/text_models"; # Model storage
      loadModels = [ ]; # Pre-load models
    };
  };

  networking.firewall.allowedTCPPorts = [ 8000 ];

}
