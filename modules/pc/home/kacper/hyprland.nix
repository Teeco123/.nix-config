{ config, pkgs, ... }:
{
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
      "$menu" = "pgrep wofi >/dev/null 2>&1 && pkill wofi || wofi --show drun";

      monitorv2 = [
        {
          output = "DP-1";
          mode = "3440x1440@160";
          position = "0x0";
          scale = 1;
          bitdepth = 10;
          cm = "hdr";
          sdrbrightness = 1.2;
          sdrsaturation = 0.98;
        }
      ];

      exec-once = [
        "hyprpaper"
        "waybar"
        "[workspace 1 silent] firefox"
        "[workspace 2 silent] wezterm"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 14;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
        "col.active_border" = "rgba(248,195,204,0.45)";
        "col.inactive_border" = "rgba(595959aa)";
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;

        active_opacity = 1;
        inactive_opacity = 1;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
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
        "blur on, match:namespace wofi"
        "ignore_alpha 0, match:namespace wofi"
        "blur on, match:namespace firefox"
        "blur on, match:namespace wezterm"
      ];

      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1, gapsin:0, gapsout:0, border:false, rounding:false"
      ];

      windowrule = [
        "float on, match:title Picture-in-Picture"
        "size 763 429, match:title Picture-in-Picture"
        "pin on, match:title Picture-in-Picture"
        "keep_aspect_ratio on, match:title Picture-in-Picture"
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
        ", XF86LaunchB, exec, $menu"
        ", F4, exec, $menu"
        "$mainMod, M, exit"
        "$mainMod, Q, killactive"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
      ];
    };
  };
}
