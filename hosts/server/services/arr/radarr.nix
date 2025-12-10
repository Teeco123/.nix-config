{ ... }:
{
  services.radarr = {
    enable = true;
    user = "radarr";
    group = "media";
    openFirewall = true;
    settings = {
      server = {
        port = 7878;
      };
      update = {
        automatically = false;
      };
    };
  };
  systemd.services.radarr.serviceConfig.UMask = "002";
}
