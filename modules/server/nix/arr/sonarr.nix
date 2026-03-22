{ pkgs, ... }:
{
  services.sonarr = {
    enable = true;
    package = pkgs.sonarr;
    user = "sonarr";
    group = "media";
    openFirewall = true;
    dataDir = "/var/lib/sonarr/.config/NzbDrone";
    settings = {
      server = {
        port = 8989;
      };
      log = {
        analyticsEnabled = false;
      };
      update = {
        automatically = false;
        mechanism = "external";
      };
    };
  };
}
