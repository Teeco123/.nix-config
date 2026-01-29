{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim

    ../../modules/pc/home/kacper/firefox.nix
    ../../modules/pc/home/kacper/waybar.nix
    ../../modules/pc/home/kacper/wofi.nix
    ../../modules/pc/home/kacper/hyprland.nix
    ../../modules/pc/home/kacper/desktop-entries.nix

    ../../modules/shared/kacper/nvim/nvim.nix
    ../../modules/shared/kacper/eza.nix
    ../../modules/shared/kacper/git.nix
    ../../modules/shared/kacper/zsh.nix
    ../../modules/shared/kacper/yazi.nix
    ../../modules/shared/kacper/wezterm.nix
  ];

  home = {
    username = "blanka";
    homeDirectory = "/home/blanka";
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
      libreoffice-qt
      hunspell
      hunspellDicts.pl_PL
    ];
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "/home/kacper/.nix-config/wallpapers/whitegray" ];
        wallpaper = [
          "DP-1, /home/kacper/.nix-config/wallpapers/whitegray"
          "HDMI-A-1, /home/kacper/.nix-config/wallpapers/whitegray"
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
