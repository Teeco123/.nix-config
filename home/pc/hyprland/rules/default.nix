_: {
  wayland.windowManager.hyprland.settings = {
    workspace_rule = [
      {
        workspace = "1";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "2";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "3";
        monitor = "HDMI-A-1";
      }
      {
        workspace = "4";
        monitor = "HDMI-A-1";
      }
    ];

    window_rule = [
      {
        match = {
          title = "^(Picture-in-Picture)$";
        };
        float = true;
        size = "763 429";
        pin = true;
        keep_aspect_ratio = true;
      }
    ];
  };
}
