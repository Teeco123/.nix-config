_: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
    ];

    layerrule = [
    ];

    windowrule = [
      "float on, match:title Picture-in-Picture"
      "size 763 429, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
      "keep_aspect_ratio on, match:title Picture-in-Picture"
      "float on, match:class .*"
    ];
  };
}
