{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../../modules/shared/kacper/nvim/nvim.nix
    ../../modules/shared/kacper/eza.nix
    ../../modules/shared/kacper/git.nix
    ../../modules/shared/kacper/zsh.nix
    ../../modules/shared/kacper/yazi.nix
    ../../modules/shared/kacper/wezterm.nix
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
      javaPackages.compiler.temurin-bin.jre-25
    ];
  };

  programs.home-manager.enable = true;
}
