_: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/pc/nix
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
