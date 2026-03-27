{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default
    inputs.sops-nix.homeManagerModules.sops

    ../../modules/macbook/kacper
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
      signal-desktop
      libreoffice-fresh
      bitwarden-desktop
      gh
      age
      sops
    ];
  };

  programs.home-manager.enable = true;
}
