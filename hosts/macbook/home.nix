{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim

    ../../modules/home/nvim/nvim.nix
    ../../modules/home/eza.nix
    ../../modules/home/git.nix
    ../../modules/home/zsh.nix
    ../../modules/home/yazi.nix
    ../../modules/home/wezterm.nix
    ../../modules/home/hyprland.nix
  ];

  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      bottom
      ripgrep
    ];
  };

  programs.home-manager.enable = true;
}
