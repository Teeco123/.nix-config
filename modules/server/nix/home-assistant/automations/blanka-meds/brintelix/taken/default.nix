_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_brintelix_taken";
      alias = "Blanka brintelix taken";
      mode = "single";

      trigger = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data = {
            action = "brintelix_taken";
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
            entity_id = "input_boolean.blanka_brintelix";
          };
        }
      ];
    }
  ];
}
