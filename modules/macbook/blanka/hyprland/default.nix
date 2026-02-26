{ pkgs, ... }:
{
  imports = [
    ./misc
    ./binds
    ./input
    ./rules
    ./device
    ./general
    ./monitors
    ./exec-once
    ./animations
    ./decoration
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    plugins = [
      pkgs.hyprlandPlugins.hyprbars
    ];
    submaps = {
      no-bind = {
        settings = {
          bind = [
            "SUPER_R, Delete, submap, reset"
          ];
        };
      };
    };
    settings = {
      "$mainMod" = "Super_L";
      "$ns-ipc" = "noctalia-shell ipc call";
    };
  };
}
