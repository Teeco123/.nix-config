{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    inputs.catppuccin.homeModules.catppuccin
    ../../modules/pc/obs.nix
    ../../modules/pc/wofi.nix
    ../../modules/pc/waybar.nix
    ../../modules/pc/firefox.nix
    ../../modules/pc/hyprland.nix
    ../../modules/pc/desktop-entries.nix

    ../../modules/shared/nvim/nvim.nix
    ../../modules/shared/eza.nix
    ../../modules/shared/git.nix
    ../../modules/shared/zsh.nix
    ../../modules/shared/yazi.nix
    ../../modules/shared/wezterm.nix
  ];

  home = {
    username = "kacper";
    homeDirectory = "/home/kacper";
    stateVersion = "25.05";
    packages = with pkgs; [
      wl-clipboard
      ripgrep
      clang
      wev
      unzip
      pwvucontrol
      vesktop
      rimsort
      unrar
      hyprpicker
      wget
      xhost
      freerdp
      bottom
    ];
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "/home/kacper/.nix-config/wallpapers/whitegray" ];
        wallpaper = [
          "DP-1, /home/kacper/.nix-config/wallpapers/whitegray"
        ];
      };
    };
    xremap = {
      enable = true;
      withWlroots = true;
      config.keymap = [
        {
          name = "copy, paste, select all";
          remap = {
            "Super_L-a" = "Control_L-a";
            "Super_L-c" = "Control_L-c";
            "Super_L-v" = "Control_L-v";
          };
          application = {
            not = [ "wezterm" ];
          };
        }
        {
          name = "close tab firefox";
          remap = {
            "Super_L-w" = "Control_L-w";
          };
          application = {
            only = [ "firefox" ];
          };
        }
        {
          name = "copy paste wezterm";
          remap = {
            "Super_L-c" = "Control_L-Shift-c";
            "Super_L-v" = "Control_L-Shift-v";
          };
          application = {
            only = [ "wezterm" ];
          };
        }
      ];
    };
  };
  programs.home-manager.enable = true;
}
