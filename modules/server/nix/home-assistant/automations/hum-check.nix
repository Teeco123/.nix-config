{ ... }:
{
  services.home-assistant.config.automation = [
    {
      id = "hum_check_primary_bedroom";
      alias = "Humidity check primary bedroom";
      mode = "single";
      trigger = [
        {
          platform = "time_pattern";
          minutes = "30";
        }
      ];
      condition = [
        {
          condition = "zone";
          entity_id = "person.kacper";
          zone = "zone.home";
        }
      ];
      action = [
        {
          choose = [
            {
              conditions = [
                {
                  condition = "numeric_state";
                  entity_id = "weather.rycerska_5";
                  attribute = "temperature";
                  above = -5;
                  below = 0;
                }
                {
                  condition = "numeric_state";
                  entity_id = "sensor.hum_temp_sensor_primary_bedroom_humidity";
                  above = 50;
                }
              ];
              sequence = [
                {
                  action = "notify.mobile_app_kacper_iphone";
                  data = {
                    title = "Humidity too high";
                    message = "Humidity is to high open window to drop it below 50%";
                    data = {
                      push = {
                        interruption-level = "time-sensitive";
                      };
                    };
                  };
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "numeric_state";
                  entity_id = "weather.rycerska_5";
                  attribute = "temperature";
                  above = -10;
                  below = -5;
                }
                {
                  condition = "numeric_state";
                  entity_id = "sensor.hum_temp_sensor_primary_bedroom_humidity";
                  above = 42;
                }
              ];
              sequence = [
                {
                  action = "notify.mobile_app_kacper_iphone";
                  data = {
                    title = "Humidity too high";
                    message = "Humidity is to high open window to drop it below 42%";
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
      ];
    }
  ];
}
