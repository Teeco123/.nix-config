_: {
  services.sonarr = {
    enable = true;
    user = "sonarr";
    group = "media";
    openFirewall = true;
    settings = {
      server = {
        port = 8989;
      };
    };
  };
}
