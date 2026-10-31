_: {
  imports = [
    ./defaults
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "kacper";
  };
}
