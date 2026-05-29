{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default
    inputs.plasma-manager.homeModules.plasma-manager

    ../../home/shared/shared
    ../../home/shared/macbook
    ../../home/blanka/shared
    ../../home/blanka/macbook
  ];

  home = {
    stateVersion = "25.11";
    packages = with pkgs; [
      asahi-audio
      prismlauncher
      obsidian
      unzip
      hyprcursor
      signal-desktop
    ];
  };

  programs.home-manager.enable = true;
}
