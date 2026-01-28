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
  ];
}
