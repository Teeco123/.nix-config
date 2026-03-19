{ pkgs, config, ... }:

{
  sops.secrets = {
    caddy-env = { };
  };

  systemd.services.caddy.serviceConfig.EnvironmentFile = config.sops.secrets.caddy-env.path;

  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.3" ];
      hash = "sha256-bL1cpMvDogD/pdVxGA8CAMEXazWpFDBiGBxG83SmXLA=";
    };

    globalConfig = ''
      acme_dns cloudflare {env.CF_API_TOKEN}
    '';

    virtualHosts = {
      "(admin)" = {
        extraConfig = ''
          @not-admin not remote_ip 100.64.0.1 100.64.0.2 100.64.0.3
          respond @not-admin "Access Denied Your IP: {client_ip}"
        '';
      };

      # PUBLIC
      "https://headscale.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.headscale.port}
        '';
      };
      "https://jellyseerr.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.jellyseerr.port}
        '';
      };
      "https://jellyfin.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:8096
        '';
      };

      # ADMIN
      "https://qbittorrent.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:3000
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
      "https://uptime-kuma.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.uptime-kuma.settings.PORT}
        '';
      };
      "https://adguard.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.adguardhome.port}
        '';
      };
      "https://homeassistant.teeco.cc" = {
        extraConfig = ''
          import admin
          reverse_proxy localhost:${toString config.services.home-assistant.config.http.server_port}
        '';
      };

      # VPN
      "https://immich.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.immich.port}
        '';
      };
      "https://mealie.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.mealie.port}
        '';
      };
      "https://vaultwarden.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}
        '';
      };
      "https://dawarich.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:6281
        '';
      };
      "https://radicale.teeco.cc" = {
        extraConfig = ''
          reverse_proxy localhost:5232
        '';
      };
    };
  };
}
