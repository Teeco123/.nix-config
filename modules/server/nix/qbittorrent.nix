{ pkgs, ... }:
{
  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 45650;
    user = "qbittorrent";
    group = "media";
    openFirewall = true;
    serverConfig = {
      Preferences = {
        WebUI = {
          AlternativeUIEnabled = true;
          RootFolder = "${pkgs.vuetorrent}/share/vuetorrent";
        };
      };
    };
  };
}
