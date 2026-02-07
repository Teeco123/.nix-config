{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim

    ../../modules/home/firefox.nix
    ../../modules/home/waybar.nix
    ../../modules/home/wofi.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/desktop-entries.nix
    ../../modules/home/zen-browser.nix
    ../../modules/home/nvim/nvim.nix
    ../../modules/home/eza.nix
    ../../modules/home/git.nix
    ../../modules/home/zsh.nix
    ../../modules/home/yazi.nix
    ../../modules/home/wezterm.nix
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
          {
            monitor = "DP-1";
            path = "/home/kacper/.nix-config/wallpapers/whitegray";
          }
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
