{ pkgs, ... }:
{
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

      env = [
        "HYPRCURSOR_THEME,Kitty"
      ];

      monitorv2 = [
        {
          output = "eDP-1";
          mode = "3024x1964@120";
          position = "0x0";
          scale = "auto";
          bitdepth = 10;
          cm = "hdr";
          sdrbrightness = 1.2;
          sdrsaturation = 0.98;
        }
      ];

      exec-once = [
        "noctalia-shell"
      ];

      plugin = {
        hyprbars = {
          enabled = true;
          bar_title_enabled = false;
          bar_color = "rgb(CFF2F8)";
          hyprbars-button = [
            "rgb(ff4040), 10, 󰖭, hyprctl dispatch killactive"
            "rgb(eeee11), 10, , hyprctl dispatch fullscreen 1"
          ];
          on_double_click = "hyprctl dispatch fullscreen 1";
        };
      };

      general = {
        gaps_in = 0;
        gaps_out = 14;
        border_size = 1;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
        "col.active_border" = "rgb(CFF2F8)";
        "col.inactive_border" = "0x000000ff";
      };

      input = {
        touchpad = {
          clickfinger_behavior = true;
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.2;
          tap-to-click = false;
        };
      };

      device = {
        name = "apple-spi-trackpad";
        sensitivity = -0.10;
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 0;
        rounding_power = 2;

        active_opacity = 1;
        inactive_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 8;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = "yes, please :)";
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      layerrule = [
      ];

      workspace = [
      ];

      windowrule = [
        "float on, match:title Picture-in-Picture"
        "size 763 429, match:title Picture-in-Picture"
        "pin on, match:title Picture-in-Picture"
        "keep_aspect_ratio on, match:title Picture-in-Picture"
        "float on, match:class .*"
      ];

      bind = [
        "SUPER_R, Delete, submap, no-bind"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod, F, fullscreen"
        "$mainMod, Tab, cyclenext"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        ", XF86Search, exec, $ns-ipc launcher toggle"
        "$mainMod, M, exit"
        "$mainMod, Q, killactive"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, $ns-ipc volume increase"
        ", XF86AudioLowerVolume, exec, $ns-ipc volume decrease"
        ", XF86MonBrightnessUp, exec, $ns-ipc brightness increase"
        ", XF86MonBrightnessDown, exec, $ns-ipc brightness decrease"

      ];
    };
  };
}
