_: {
  imports = [
    ./misc
    ./input
    ./device
    ./general
    ./exec-once
    ./decoration
    ./rules
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
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
