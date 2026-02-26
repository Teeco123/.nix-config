{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    #inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    #inputs.vicinae.homeManagerModules.default
    inputs.noctalia.homeModules.default

    ../../modules/macbook/kacper/nvim
    ../../modules/macbook/kacper/eza
    ../../modules/macbook/kacper/git
    ../../modules/macbook/kacper/zsh
    ../../modules/macbook/kacper/yazi
    ../../modules/macbook/kacper/wezterm
    ../../modules/macbook/kacper/hyprland
    ../../modules/macbook/kacper/zen-browser
    ../../modules/macbook/kacper/noctalia-shell
    ../../modules/macbook/kacper/obsidian
  ];

  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      bottom
      ripgrep
      asahi-audio
      prismlauncher
      feishin
      qt6.qtdeclarative
    ];
  };

  programs.home-manager.enable = true;
}
