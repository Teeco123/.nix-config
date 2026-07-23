_: {
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
    {
      platform = "group";
      name = "Primary Bedroom lights";
      unique_id = "primary_bedroom_lights";
      entities = [
        "light.primary_bedroom_led"
      ];
    }
    {
      platform = "group";
      name = "Corridor lights";
      unique_id = "corridor_lights";
      entities = [ ];
    }
    {
      platform = "group";
      name = "Bathroom lights";
      unique_id = "bathroom_lights";
      entities = [ ];
    }
    {
      platform = "group";
      name = "Living Room lights";
      unique_id = "living_room_lights";
      entities = [ ];
    }
  ];
}
