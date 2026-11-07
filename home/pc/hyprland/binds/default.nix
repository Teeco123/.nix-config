{ lib, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    # Submap
    {
      _args = [
        "SUPER_R + Delete"
        (lib.generators.mkLuaInline ''hl.dsp.submap("no-bind")'')
      ];
    }
    # Launchers & Applications
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Return"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wezterm")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Space"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher || noctalia-shell ipc call launcher toggle")'')
      ];
    }
    {
      _args = [
        "XF86Search"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher || noctalia-shell ipc call launcher toggle")'')
      ];
    }
    # Window management
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Q"'')
        (lib.generators.mkLuaInline "hl.dsp.window.close()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + M"'')
        (lib.generators.mkLuaInline "hl.dsp.exit()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F"'')
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + CONTROL + F"'')
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + ALT + F"'')
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Tab"'')
        (lib.generators.mkLuaInline "hl.dsp.window.cycle_next()")
      ];
    }
    # Workspaces focus
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + 1"'')
        (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 1 })")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + 2"'')
        (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 2 })")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + 3"'')
        (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 3 })")
      ];
    }
    # Move window to workspace
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + 1"'')
        (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1 })")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + 2"'')
        (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2 })")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + 3"'')
        (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3 })")
      ];
    }
    # Mouse movements
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:272"'')
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        { mouse = true; }
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:273"'')
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        { mouse = true; }
      ];
    }
    # Volume and brightness controls (repeating keys)
    {
      _args = [
        "XF86AudioRaiseVolume"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-up || noctalia-shell ipc call volume increase")'')
        { repeat = true; }
      ];
    }
    {
      _args = [
        "XF86AudioLowerVolume"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-down || noctalia-shell ipc call volume decrease")'')
        { repeat = true; }
      ];
    }
    {
      _args = [
        "XF86MonBrightnessUp"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-up || noctalia-shell ipc call brightness increase")'')
        { repeat = true; }
      ];
    }
    {
      _args = [
        "XF86MonBrightnessDown"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-down || noctalia-shell ipc call brightness decrease")'')
        { repeat = true; }
      ];
    }
  ];
}
