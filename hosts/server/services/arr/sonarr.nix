{ ... }:
{
  services.sonarr = {
    enable = true;
    user = "sonarr";
    group = "media";
    openFirewall = true;
    settings = {
      log = {
        logLevel = "debug";
      };
      server = {
        port = 8989;
      };
      update = {
        automatically = false;
      };
    };
  };
  systemd.services.sonarr.serviceConfig.UMask = "002";
}
