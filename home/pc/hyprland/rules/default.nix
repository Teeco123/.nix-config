_: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:eDP-1"
      "2, monitor:eDP-1"
      "3, monitor:eDP-1"
      "4, monitor:eDP-1"
    ];

    layerrule = [
    ];

    windowrule = [
      "float on, match:title Picture-in-Picture"
      "size 763 429, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
      "keep_aspect_ratio on, match:title Picture-in-Picture"
    ];
  };
}
