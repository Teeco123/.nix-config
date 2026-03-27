{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nixvim.homeModules.default
    inputs.noctalia.homeModules.default
    inputs.sops-nix.homeManagerModules.sops

    ../../modules/pc/kacper
  ];

  home = {
    username = "kacper";
    homeDirectory = "/home/kacper";
    stateVersion = "25.05";
    packages = with pkgs; [
      wl-clipboard
      ripgrep
      clang
      wev
      unzip
      pwvucontrol
      vesktop
      rimsort
      unrar
      hyprpicker
      wget
      xhost
      freerdp
      bottom
      libreoffice-qt
      hunspell
      hunspellDicts.pl_PL
    ];
  };

  services = {
    xremap = {
      enable = true;
      withWlroots = true;
      config.keymap = [
        {
          name = "copy, paste, select all";
          remap = {
            "Super_L-a" = "Control_L-a";
            "Super_L-c" = "Control_L-c";
            "Super_L-v" = "Control_L-v";
          };
          application = {
            not = [ "wezterm" ];
          };
        }
        {
          name = "close tab firefox";
          remap = {
            "Super_L-w" = "Control_L-w";
          };
          application = {
            only = [ "zen" ];
          };
        }
        {
          name = "copy paste wezterm";
          remap = {
            "Super_L-c" = "Control_L-Shift-c";
            "Super_L-v" = "Control_L-Shift-v";
          };
          application = {
            only = [ "wezterm" ];
          };
        }
      ];
    };
  };
  programs.home-manager.enable = true;
}
