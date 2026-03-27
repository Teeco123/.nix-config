{
  modulesPath,
  lib,
  pkgs,
  ...
}@args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];
  networking.defaultGateway = "192.168.122.1"; # The IP of your virt-manager virbr0 router
  networking.nameservers = [ "8.8.8.8" ];
  networking = {
    hostName = "a";
    interfaces.enp3s0 = {
      ipv4.addresses = [
        {
          address = "192.168.122.10";
          prefixLength = 24;
        }
      ];
    };
  };
  services = {
    k3s = {
      enable = true;
      role = "server";
      token = "123";
      clusterInit = true;
    };
  };

  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI/eUChh6jB4vuW71zUBnS7i3hUnQK+AP9IDgs3BVRW macbook"
  ]
  ++ (args.extraPublicKeys or [ ]); # this is used for unit-testing this module and can be removed if not needed

  system.stateVersion = "24.05";
}
