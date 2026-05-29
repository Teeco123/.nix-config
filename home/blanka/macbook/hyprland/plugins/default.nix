_: {
  wayland.windowManager.hyprland.settings.plugin = {
    hyprbars = {
      enabled = false;
      bar_title_enabled = false;
      bar_color = "rgb(CFF2F8)";
      hyprbars-button = [
        "rgb(ff4040), 10, 󰖭, hyprctl dispatch killactive"
        "rgb(eeee11), 10, , hyprctl dispatch fullscreen 1"
      ];
      on_double_click = "hyprctl dispatch fullscreen 1";
    };
  };
}
