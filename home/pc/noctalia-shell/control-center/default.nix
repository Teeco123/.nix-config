_: {
  programs.noctalia-shell.settings.controlCenter = {
    position = "close_to_bar_button";
    diskPath = "/";
    shortcuts = {
      left = [
        { id = "Network"; }
        { id = "Bluetooth"; }
        { id = "WallpaperSelector"; }
        { id = "Notifications"; }
        { id = "NightLight"; }
      ];
      right = [ ];
    };
    cards = [
      {
        enabled = true;
        id = "profile-card";
      }
      {
        enabled = true;
        id = "shortcuts-card";
      }
      {
        enabled = true;
        id = "audio-card";
      }
      {
        enabled = true;
        id = "brightness-card";
      }
      {
        enabled = true;
        id = "weather-card";
      }
      {
        enabled = true;
        id = "media-sysmon-card";
      }
    ];
  };
}
