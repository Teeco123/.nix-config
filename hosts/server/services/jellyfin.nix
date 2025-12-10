{ ... }:
{
  services.jellyfin = {
    enable = true;
    user = "jellyfin";
    group = "media";
    openFirewall = true;
  };
}
