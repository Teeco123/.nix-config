{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ./services/cloudflared.nix
    ./services/immich.nix
    ./services/qbittorrent.nix
  ];

  nix = {
    settings = {
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    initrd = {
      systemd = {
        enable = true;
      };
      services = {
        swraid = {
          enable = true;
          mdadmConf = ''
            ARRAY /dev/md0 level=raid1 num-devices=2 metadata=1.2 UUID=fbe7880d:944cae72:8f4f67db:c8ed6be8
               devices=/dev/sdb,/dev/sdc
          '';
        };
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems = {
    "/mnt/md0" = {
      device = "/dev/disk/by-uuid/ef63c214-c45f-4239-9559-9ce3bd6b6d72";
      fsType = "ext4";
    };
  };

  networking = {
    hostName = "server";
    networkmanager = {
      enable = true;
    };
  };

  environment = {
    systemPackages = [ ];
  };

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users = {
    server = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
      ];
    };
  };

  services = {
    openssh = {
      enable = true;
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
