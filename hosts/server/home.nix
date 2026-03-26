{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    inputs.sops-nix.homeManagerModules.sops

    ../../modules/server/server/nvim
    ../../modules/server/server/eza
    ../../modules/server/server/git
    ../../modules/server/server/zsh
    ../../modules/server/server/yazi
    ../../modules/server/server/wezterm
    ../../modules/server/server/sops
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
      python313Packages.phonenumbers
      python314Packages.phonenumbers
    ];
  };

  programs.home-manager.enable = true;
}
