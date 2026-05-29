{ ... }:
{
  imports = [
    ./misc
    ./input
    ./rules
    ./device
    ./general
    ./exec-once
    ./decoration
    ./plugins
    ./env
  ];

  wayland.windowManager.hyprland = {
    enable = false;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    plugins = [
      #pkgs.hyprlandPlugins.hyprbars
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
