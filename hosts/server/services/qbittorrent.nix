{ ... }:
{
  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    user = "qbittorrent";
    torrentingPort = 45650;
    openFirewall = true;
  };
}
