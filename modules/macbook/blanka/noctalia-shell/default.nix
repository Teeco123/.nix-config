_: {

  imports = [
    ./ui
    ./bar
    ./dock
    ./general
    ./plugins
    ./calendar
    ./location
    ./wallpaper
    ./app-launcher
    ./session-menu
    ./color-schemes
    ./control-center
  ];

  programs.noctalia-shell = {
    enable = true;
    settings.settingsVersion = 53;
  };
}
