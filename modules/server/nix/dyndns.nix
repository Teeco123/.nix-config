{ config, ... }:
{
  sops.secrets = {
    cloudflare-dyndns-env = { };
  };

  services.cloudflare-dyndns = {
    enable = true;
    ipv4 = true;
    deleteMissing = true;
    domains = [
      "*.teeco.cc"
      "headscale.teeco.cc"
      "jellyfin.teeco.cc"
      "jellyseerr.teeco.cc"
      "pedaliada.teeco.cc"
    ];
    apiTokenFile = config.sops.secrets.cloudflare-dyndns-env.path;
  };
}
