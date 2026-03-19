_: {
  services.qbittorrent = {
    enable = true;
    webuiPort = 8080;
    torrentingPort = 45650;
    user = "qbittorrent";
    group = "media";
    openFirewall = true;
  };
}
