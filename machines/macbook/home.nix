{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.sops-nix.homeManagerModules.sops

    ../../home/shared/shared
    ../../home/shared/macbook
    ../../home/kacper/shared
    ../../home/kacper/macbook
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
