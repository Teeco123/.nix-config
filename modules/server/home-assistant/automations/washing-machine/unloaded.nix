{ ... }:

{
  services.home-assistant.config.automation = [
    {
      id = "washing_machine_unloaded";
      alias = "Washing machine unloaded";
      description = "";
      mode = "single";

      trigger = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data = {
            action = "washing_machine_unloaded";
          };
        }
      ];

      action = [
        {
          action = "input_boolean.turn_off";
          target = {
            entity_id = "input_boolean.washing_machine_full";
          };
        }
      ];
    }
  ];
}
