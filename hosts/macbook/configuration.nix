_: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/macbook/nix
  ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "kacper" ];

  virtualisation.libvirtd.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
