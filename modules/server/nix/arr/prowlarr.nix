_: {
  services.prowlarr = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        port = 9696;
      };
    };
  };
}
