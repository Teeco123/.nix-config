{ ... }:
{
  services.cloudflare-dyndns = {
    enable = true;
    ipv4 = true;
    deleteMissing = true;
    domains = [
      "*.teeco.cc"
      "pedaliada.teeco.cc"
    ];
    apiTokenFile = "/home/server/.cloudflared/api_token";
  };
}
