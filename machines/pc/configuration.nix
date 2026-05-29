_: {
  imports = [
    ./hardware-configuration.nix

    ../../hosts/pc
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
