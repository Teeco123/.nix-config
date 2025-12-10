{ config, ... }:
{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "https://headscale.teeco.cc" = {
        extraConfig = ''
                  	reverse_proxy localhost:36543
          				'';
      };
      "https://qbittorrent.teeco.cc" = {
        extraConfig = ''
          				  reverse_proxy 100.64.0.1:8080
          				'';
      };
    };
  };
}
