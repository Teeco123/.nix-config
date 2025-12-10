{ ... }:
{
  services.cloudflare-dyndns = {
    enable = true;
    ipv4 = true;
    deleteMissing = true;
    domains = [
      "headscale.teeco.cc"
      "qbittorrent.teeco.cc"
    ];
    apiTokenFile = "/home/server/.cloudflared/api_token";
  };
}
