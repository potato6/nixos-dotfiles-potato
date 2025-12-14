{ pkgs, ... }:

{
  users = {
    mutableUsers = true;
    users.potato = {
      hashedPassword = null;
      homeMode = "755";
      isNormalUser = true;
      description = "default";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
        "adbusers"
        "transmission"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
  users.users.transmission.extraGroups = [ "users" ];

  networking.hostName = "potato";

  # Localization Settings
  # These settings control how the system handles time, language, and console display.

  # Set your time zone
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "br-abnt2";

}
