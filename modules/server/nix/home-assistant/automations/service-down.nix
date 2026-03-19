{
  services.home-assistant.config.automation = [
    {
      id = "service_down";
      alias = "Service down";
      description = "";
      mode = "single";
      trigger =
        let
          monitoredServices = [
            "bazarr"
            "immich"
            "jellyfin"
            "jellyseerr"
            "mealie"
            "prowlarr"
            "qbittorrent"
            "radarr"
            "sonarr"
            "vaultwarden"
          ];
        in
        builtins.map (service: {
          trigger = "state";
          entity_id = [ "sensor.${service}_status" ];
          to = "down";
          id = service;
        }) monitoredServices;

      actions = [
        {
          action = "notify.mobile_app_kacper_iphone";
          data = {
            title = "Service Alert";
            message = "{{ trigger.id | capitalize }} is down!";
            data = {
              push = {
                interruption-level = "time-sensitive";
              };
            };
          };
        }
      ];
    }
  ];
}
