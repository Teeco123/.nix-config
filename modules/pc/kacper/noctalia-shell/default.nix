{ pkgs, ... }:
{

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
    package = pkgs.noctalia-shell.override { calendarSupport = true; };
    settings.settingsVersion = 53;
  };
}
