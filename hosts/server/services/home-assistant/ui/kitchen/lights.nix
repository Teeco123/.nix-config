{
  type = "grid";
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "Lights";
      icon = "mdi:lightbulb-group";
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "slider";
      entity = "light.kitchen_lights";
      name = "All lights";
      slider_live_update = true;
      allow_light_slider_to_0 = true;
      light_trainsition = true;
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "slider";
      entity = "light.led_kitchen";
      name = "LED";
      slider_live_update = true;
      allow_light_slider_to_0 = true;
      light_trainsition = true;
    }
  ];
}
