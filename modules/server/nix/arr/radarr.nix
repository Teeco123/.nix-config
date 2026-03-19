_: {
  services.radarr = {
    enable = true;
    user = "radarr";
    group = "media";
    openFirewall = true;
    settings = {
      server = {
        port = 7878;
      };
    };
  };
}
