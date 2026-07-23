{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.sops-nix.homeManagerModules.sops

    #../../home/macbook
    ../../home/shared
  ];

  home = {
    stateVersion = "26.05";
    username = "kacper";
    homeDirectory = "/Users/kacper";
    packages = with pkgs; [
    ];
  };

  programs.home-manager.enable = true;
}
