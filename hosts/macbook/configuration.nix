{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/macbook/darwin/tailscale.nix
    ../../modules/macbook/darwin/aerospace.nix

    ../../modules/macbook/darwin/defaults/dock.nix
    ../../modules/macbook/darwin/defaults/finder.nix
    ../../modules/macbook/darwin/defaults/login_window.nix
    ../../modules/macbook/darwin/defaults/control_center.nix
    ../../modules/macbook/darwin/defaults/launch_services.nix
    ../../modules/macbook/darwin/defaults/activity_monitor.nix
    ../../modules/macbook/darwin/defaults/menu_extra_clock.nix
    ../../modules/macbook/darwin/defaults/ns_global_domain.nix
    ../../modules/macbook/darwin/defaults/global_preferences.nix
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
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [ ];
  };

  networking = {
    knownNetworkServices = [
      "Wi-Fi"
    ];
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  users.users = {
    kacper = {
      name = "kacper";
      home = "/Users/kacper";
      shell = pkgs.zsh;
    };
  };
  system = {
    primaryUser = "kacper";
    stateVersion = 6;
  };
}
