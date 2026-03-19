{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/server/home-assistant

    ../../modules/server/cloudflared.nix
    ../../modules/server/caddy.nix
    ../../modules/server/dyndns.nix
    ../../modules/server/immich.nix
    ../../modules/server/pihole.nix
    ../../modules/server/jellyfin.nix
    ../../modules/server/headscale.nix
    ../../modules/server/tailscale.nix
    ../../modules/server/borgbackup.nix
    ../../modules/server/qbittorrent.nix
    ../../modules/server/qbitwebui.nix
    ../../modules/server/vaultwarden.nix
    ../../modules/server/mealie.nix
    ../../modules/server/uptime-kuma.nix
    ../../modules/server/dawarich.nix
    ../../modules/server/samba.nix
    ../../modules/server/adguardhome.nix

    ../../modules/server/arr/bazarr.nix
    ../../modules/server/arr/radarr.nix
    ../../modules/server/arr/sonarr.nix
    ../../modules/server/arr/prowlarr.nix
    ../../modules/server/arr/jellyseerr.nix
    ../../modules/server/arr/flaresolverr.nix
  ];

  services.thermald.enable = true;

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
    powertop = {
      enable = true;
    };
  };

  systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-ocl
      intel-media-driver
      intel-compute-runtime
      vpl-gpu-rt
      libvdpau-va-gl
    ];
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
    defaultGateway = {
      address = "192.168.100.1";
      interface = "enp1s0";
    };
    interfaces = {
      enp1s0 = {
        ipv4 = {
          addresses = [
            {
              addresses = "192.168.100.2";
              prefixLength = 24;
            }
          ];
        };
      };
    };
    firewall = {
      allowedTCPPorts = [
        34629
        64034
        45650
        80
        443
        25565
        5232
        53
        9987
        30033
      ];
      allowedUDPPorts = [
        25565
        45650
        53
        67
        9987
        30033
      ];
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
      smbusers = { };
    };
    users = {
      server = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
          "docker"
        ];
      };
      jellyfin = {
        extraGroups = [
          "video"
          "render"
        ];
      };
      kacper = {
        isNormalUser = true;
        extraGroups = [ "smbusers" ];
      };
      blanka = {
        isNormalUser = true;
        extraGroups = [ "smbusers" ];
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
