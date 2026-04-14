{ ... }:
{
  security.pam = {
    services = {
      login.enableAppArmor = true;
      sudo-rs.enableAppArmor = true;
      gnupg.enable = true;
      fscrypt.enable = true;
    };
    loginLimits = [
      {
        domain = "*";
        item = "memlock";
        type = "soft";
        value = "2147484";
      }
      {
        domain = "*";
        item = "memlock";
        type = "hard";
        value = "2147484";
      }
    ];
  };
}
