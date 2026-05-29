{ pkgs, ... }:
{
  services.radarr = {
    enable = true;
    package = pkgs.radarr;
    user = "radarr";
    group = "media";
    openFirewall = true;
    dataDir = "/var/lib/radarr/.config/Radarr";
    settings = {
      server = {
        port = 7878;
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
