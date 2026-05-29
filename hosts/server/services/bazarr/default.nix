{ pkgs, ... }:
{
  services.bazarr = {
    enable = true;
    package = pkgs.bazarr;
    user = "bazarr";
    group = "media";
    listenPort = 6767;
    openFirewall = true;
    dataDir = "/var/lib/bazarr";
  };
}
