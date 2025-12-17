{ ... }:
{
  services.bazarr = {
    enable = true;
    user = "bazarr";
    group = "media";
    listenPort = 6767;
    openFirewall = true;
  };
}
