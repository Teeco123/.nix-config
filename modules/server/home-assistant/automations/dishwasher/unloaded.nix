{ ... }:
{
  services.home-assistant.config.automation = [
    {
      id = "dishwasher_unloaded";
      alias = "Dishwasher unloaded";
      description = "";
      mode = "single";
      trigger = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data = {
            action = "dishwasher_unloaded";
          };
        }
      ];
      action = [
        {
          action = "input_boolean.turn_off";
          target = {
            entity_id = "input_boolean.dishwasher_full";
          };
        }
        {
          action = "input_select.select_next";
          target = {
            entity_id = "input_select.dishwasher_unload_person";
          };
          data = {
            cycle = true;
          };
        }
      ];
    }
  ];
}
