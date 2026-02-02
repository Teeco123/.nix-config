{ ... }:
{
  services.home-assistant.config.light = [
    {
      platform = "group";
      name = "Kitchen lights";
      unique_id = "kitchen_lights";
      entities = [
        "light.led_kitchen"
      ];
    }
    {
      platform = "group";
      name = "Secondary Bedroom lights";
      unique_id = "secondary_bedroom_lights";
      entities = [
        "light.secondary_bedroom_desk_led"
      ];
    }
  ];
}
