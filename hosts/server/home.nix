{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../../modules/home/nvim/nvim.nix
    ../../modules/home/eza.nix
    ../../modules/home/git.nix
    ../../modules/home/zsh.nix
    ../../modules/home/yazi.nix
    ../../modules/home/wezterm.nix
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
