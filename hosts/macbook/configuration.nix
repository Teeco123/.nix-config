_: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/macbook/nix/environment
    ../../modules/macbook/nix/nix
    ../../modules/macbook/nix/pipewire
    ../../modules/macbook/nix/boot
    ../../modules/macbook/nix/users
    ../../modules/macbook/nix/nixpkgs
    ../../modules/macbook/nix/hardware
    ../../modules/macbook/nix/services
    ../../modules/macbook/nix/networking
    ../../modules/macbook/nix/programs
    ../../modules/macbook/nix/time
    ../../modules/macbook/nix/fonts
    ../../modules/macbook/nix/sops
  ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "kacper" ];

  virtualisation.libvirtd.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
