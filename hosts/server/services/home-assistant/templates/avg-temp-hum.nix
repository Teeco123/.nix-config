{ ... }:
{
  services.home-assistant.config.sensor = [
    {
      platform = "min_max";
      unique_id = "average_temperature";
      name = "Average temperature";
      type = "mean";
      round_digits = 1;
      entity_ids = [
        "sensor.hum_temp_sensor_primary_bedroom_temperature"
      ];
    }
    {
      platform = "min_max";
      unique_id = "average_humidity";
      name = "Average humidity";
      type = "mean";
      round_digits = 1;
      entity_ids = [
        "sensor.hum_temp_sensor_primary_bedroom_humidity"
      ];
    }
  ];
}
