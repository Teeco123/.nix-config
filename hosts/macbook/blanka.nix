{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    inputs.vicinae.homeManagerModules.default
    inputs.noctalia.homeModules.default

    ../../modules/macbook/blanka/hyprland
    ../../modules/macbook/blanka/zsh
    ../../modules/macbook/blanka/wezterm
    ../../modules/macbook/blanka/nvim
    ../../modules/macbook/blanka/yazi
    ../../modules/macbook/blanka/zen-browser
    ../../modules/macbook/blanka/eza
    ../../modules/macbook/blanka/noctalia-shell
    ../../modules/macbook/blanka/git
    ../../modules/macbook/blanka/waybar
    ../../modules/macbook/blanka/vicinae
    ../../modules/macbook/blanka/hyprpaper
    ../../modules/macbook/blanka/xremap
  ];

  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      ripgrep
      asahi-audio
      prismlauncher
      obsidian
      unzip
      hyprcursor
      github-desktop
    ];
  };

  programs.home-manager.enable = true;
}
