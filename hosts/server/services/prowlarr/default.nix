{ pkgs, ... }:
{
  services.prowlarr = {
    enable = true;
    package = pkgs.prowlarr;
    openFirewall = true;
    dataDir = "/var/lib/prowlarr";
    settings = {
      server = {
        port = 9696;
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
