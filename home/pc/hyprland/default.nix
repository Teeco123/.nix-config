{ lib, ... }:
{
  imports = [
    ./animations
    ./binds
    ./decoration
    ./device
    ./exec-once
    ./general
    ./input
    ./misc
    ./monitors
    ./rules
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    submaps = {
      no-bind = {
        settings = {
          bind = [
            {
              _args = [
                "SUPER_R + Delete"
                (lib.generators.mkLuaInline ''hl.dsp.submap("reset")'')
              ];
            }
          ];
        };
      };
    };
    settings = {
      mod = {
        _var = "SUPER";
      };
      env = [
        {
          _args = [
            "LIBVA_DRIVER_NAME"
            "nvidia"
          ];
        }
        {
          _args = [
            "__GLX_VENDOR_LIBRARY_NAME"
            "nvidia"
          ];
        }
        {
          _args = [
            "NVD_BACKEND"
            "direct"
          ];
        }
      ];
    };
  };
}
