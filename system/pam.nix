{ ... }: {
  security.pam.services = {
    login.enableAppArmor = true;
    sudo-rs.enableAppArmor = true;
    gnupg.enable = true;
    fscrypt.enable = true;
  };
}
