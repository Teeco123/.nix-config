{ lib, ... }:
{
  wayland.windowManager.hyprland.settings.on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            hl.exec_cmd("noctalia")
            hl.exec_cmd("[workspace 1 silent] zen")
            hl.exec_cmd("[workspace 2 silent] wezterm")
          end
        '')
      ];
    }
  ];
}
