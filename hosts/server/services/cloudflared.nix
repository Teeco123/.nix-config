{ ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "488542df-e2ba-44ec-ac89-3ed0223f8e59" = {
        credentialsFile = "/home/server/.cloudflared/488542df-e2ba-44ec-ac89-3ed0223f8e59.json";
        default = "http_status:404";
        ingress = {
          "*.teeco.cc" = {
            service = "https://localhost:80";
          };
        };
      };
    };
  };
}
