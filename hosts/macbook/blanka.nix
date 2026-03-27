{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default

    ../../modules/macbook/blanka
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
      github-desktop
    ];
  };

  programs.home-manager.enable = true;
}
