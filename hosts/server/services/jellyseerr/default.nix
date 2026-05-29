{ pkgs, ... }:
{
  services.jellyseerr = {
    enable = true;
    package = pkgs.jellyseerr;
    port = 5055;
    openFirewall = true;
    configDir = "/var/lib/jellyseerr/config";
  };
}
