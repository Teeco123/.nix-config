{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ./services/cloudflared.nix
    ./services/immich.nix
    ./services/qbittorrent.nix
    ./services/arr/prowlarr.nix
    ./services/arr/flaresolverr.nix
    ./services/arr/sonarr.nix
    ./services/arr/radarr.nix
    ./services/arr/jellyseerr.nix
    ./services/arr/bazarr.nix
    ./services/jellyfin.nix
    ./services/vaultwarden.nix
    ./services/tailscale.nix
    ./services/headscale.nix
    ./services/caddy.nix
    ./services/dyndns.nix
    ./services/pihole.nix
    ./services/borgbackup.nix
  ];

  services.thermald.enable = true;

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
    powertop = {
      enable = true;
    };
  };

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
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems = {
    "/mnt/md0" = {
      device = "/dev/disk/by-uuid/bec2aa45-2f37-4d48-8910-1092ccc0f790";
      fsType = "ext4";
    };
    "/mnt/backup" = {
      device = "/dev/disk/by-uuid/47349bdf-a2b2-4612-a3b7-831144098ade";
      fsType = "ext4";
    };
  };

  networking = {
    hostName = "server";
    networkmanager = {
      enable = true;
    };
    firewall = {
      allowedTCPPorts = [
        34629
        64034
        45650
        80
        443
      ];
      allowedUDPPorts = [ 45650 ];
    };
  };

  environment = {
    systemPackages = [ ];
  };

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    groups = {
      media = { };
    };
    users = {
      server = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
        ];
      };
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
