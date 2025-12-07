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

    ../../modules/shared/nvim/nvim.nix
    ../../modules/shared/eza.nix
    ../../modules/shared/git.nix
    ../../modules/shared/zsh.nix
    ../../modules/shared/yazi.nix
    ../../modules/shared/wezterm.nix
  ];

  home = {
    username = "server";
    homeDirectory = "/home/server";
    stateVersion = "25.11";
    packages = with pkgs; [
      ripgrep
      unzip
      wget
      bottom
    ];
  };

  programs.home-manager.enable = true;
}
