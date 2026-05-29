_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_magnesium_taken";
      alias = "Blanka magnesium taken";
      mode = "single";

      trigger = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data = {
            action = "magnesium_taken";
          };
          context = {
            user_id = [
              "56ef46b1fe2b4d78addded7beb7cebad"
            ];
          };
        }
      ];

      action = [
        {
          action = "input_boolean.turn_on";
          target = {
            entity_id = "input_boolean.blanka_magnesium";
          };
        }
      ];
    }
  ];
}
