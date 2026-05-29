_: {
  imports = [
    ./hardware-configuration.nix
    ../../hosts/macbook
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
