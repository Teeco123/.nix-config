{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/pc/obs.nix
    ../../modules/pc/tailscale.nix
    ../../modules/pc/sunshine.nix
    ../../modules/pc/pipewire.nix
  ];

  fileSystems."/mnt/obs" = {
    device = "/dev/disk/by-uuid/6F65-D0BB";
    fsType = "exfat";
    options = [
      "uid=1000"
      "gid=100"
      "dmask=007"
      "fmask=117"
      "nofail"
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

  virtualisation.docker = {
    enable = true;
  };

  environment = {
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    systemPackages = with pkgs; [ polymc ];
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

  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "start-hyprland";
          user = "kacper";
        };
        default_session = initial_session;
      };
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
  };

  networking = {
    hostName = "nixos";
    firewall = {
      allowedTCPPorts = [ 7777 ];
      allowedUDPPorts = [ 7777 ];
    };
    networkmanager = {
      enable = true;
    };
  };

  time = {
    timeZone = "Europe/Warsaw";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    zsh = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
      dedicatedServer.openFirewall = true;
      remotePlay.openFirewall = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        xorg.libXrandr
        xorg.libX11
        libGL
        krb5
        glib
        glibc
        nss
        nspr
        libxmu
        libcap
        libxcursor
        libavif
        libxi
        libdecor
        libinput
        seatd
        pixman
        libxcomposite
        libxxf86vm
        libxdamage
        libxfixes
        libxtst
        libxres
        libxrender
        libxau
        libxdmcp
        libxext
        libxkbcommon
        freetype
        expat
        fontconfig
        dbus
        alsa-lib
        SDL2
        wayland
        libdrm
        libei
        luajit
        vulkan-loader
        python3
      ];
    };
  };

  users.users = {
    kacper = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
        "docker"
      ];
    };
    blanka = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
