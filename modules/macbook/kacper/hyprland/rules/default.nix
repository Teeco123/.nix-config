_: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:DP-1"
      "2, monitor:DP-1"
      "3, monitor:DP-1, gapsin:0, gapsout:0, border:false, rounding:false"
    ];

    layerrule = [
      "blur on, match:namespace wofi"
      "ignore_alpha 0, match:namespace wofi"
      "blur on, match:namespace zen"
      "blur on, match:namespace wezterm"
    ];

    windowrule = [
      "float on, match:title Picture-in-Picture"
      "size 763 429, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
      "keep_aspect_ratio on, match:title Picture-in-Picture"
    ];
  };
}
