_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_omega_3_taken";
      alias = "Blanka omega 3 taken";
      mode = "single";

      trigger = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data = {
            action = "omega_3_taken";
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
            entity_id = "input_boolean.blanka_omega_3";
          };
        }
      ];
    }
  ];
}
