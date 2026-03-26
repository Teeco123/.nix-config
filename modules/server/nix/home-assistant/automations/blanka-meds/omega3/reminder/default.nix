_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_omega_3_reminder";
      alias = "Blanka omega 3 reminder";
      mode = "single";

      trigger = [
        {
          trigger = "time_pattern";
          hours = "/1";
        }
      ];

      condition = [
        {
          condition = "time";
          after = "12:00:00";
          before = "18:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_omega_3";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your omega 3";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-omega-3-reminder";
              actions = [
                {
                  action = "omega_3_taken";
                  title = "Pills taken";
                }
              ];
              push = {
                "interruption-level" = "time-sensitive";
                sound = "meow-1.wav";
              };
            };
          };
        }
      ];
    }
  ];
}
