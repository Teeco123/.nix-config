{ config, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "(admin)" = {
        extraConfig = ''
          @not-admin not remote_ip 100.64.0.1 100.64.0.2 100.64.0.3 100.64.0.5
          respond @not-admin "Access Denied"
        '';
      };
      "https://headscale.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.headscale.port}
        '';
      };
      "https://qbittorrent.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.qbittorrent.webuiPort}
        '';
      };
      "https://radarr.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.radarr.settings.server.port}
        '';
      };
      "https://sonarr.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.sonarr.settings.server.port}
        '';
      };
      "https://prowlarr.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.prowlarr.settings.server.port}
        '';
      };
      "https://bazarr.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.bazarr.listenPort}
        '';
      };
    };
  };
}
