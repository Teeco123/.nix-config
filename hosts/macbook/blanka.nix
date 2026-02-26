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

    ../../modules/macbook/blanka/hyprland.nix
    ../../modules/macbook/blanka/zsh.nix
    ../../modules/macbook/blanka/wezterm.nix
    ../../modules/macbook/blanka/nvim
    ../../modules/macbook/blanka/yazi.nix
    ../../modules/macbook/blanka/zen-browser.nix
    ../../modules/macbook/blanka/eza.nix
    ../../modules/macbook/blanka/noctalia-shell
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
    ];
  };

  programs.home-manager.enable = true;
}
