{ config, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "488542df-e2ba-44ec-ac89-3ed0223f8e59" = {
        credentialsFile = "/home/server/.cloudflared/488542df-e2ba-44ec-ac89-3ed0223f8e59.json";
        default = "http_status:404";
        ingress = {
          "jellyfin.teeco.cc" = {
            service = "http://localhost:8096";
          };
          "jellyseerr.teeco.cc" = {
            service = "http://localhost:${toString config.services.jellyseerr.port}";
          };
          "vaultwarden.teeco.cc" = {
            service = "http://localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          };
          "homeassistant.teeco.cc" = {
            service = "http://localhost:${toString config.services.home-assistant.config.http.server_port}";
          };
        };
      };
    };
  };
}
