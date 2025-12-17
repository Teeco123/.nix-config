{ pkgs, ... }:
{
  xdg.desktopEntries = {
    yazi = {
      name = "Files";
      exec = "wezterm -e yazi";
      terminal = false;
    };
    nvim = {
      name = "Text editor";
      exec = "wezterm -e nvim";
      terminal = false;
    };
    vesktop = {
      name = "Discord";
      exec = "vesktop";
      terminal = false;
    };
    "com.saivert.pwvucontrol" = {
      name = "Sound";
      exec = "pwvucontrol";
      terminal = false;
    };
    firefox = {
      name = "Firefox";
      exec = "firefox";
      terminal = false;
    };
    "org.wezfurlong.wezterm" = {
      name = "Terminal";
      exec = "wezterm";
      terminal = false;
    };
  };
}
