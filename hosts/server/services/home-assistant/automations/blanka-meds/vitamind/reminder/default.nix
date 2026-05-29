_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_vitamin_d_reminder";
      alias = "Blanka vitamin D reminder";
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
          entity_id = "input_boolean.blanka_vitamin_d";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your vitamin D";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-vitamin-d-reminder";
              actions = [
                {
                  action = "vitamin_d_taken";
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
