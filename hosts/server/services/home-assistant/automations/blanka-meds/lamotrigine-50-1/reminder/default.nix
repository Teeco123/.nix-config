_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_lamotrigine_50_1_reminder";
      alias = "Blanka lamotrigine 50mg 1 reminder";
      mode = "single";

      trigger = [
        {
          trigger = "time_pattern";
          minutes = "/10";
        }
      ];

      condition = [
        {
          condition = "time";
          after = "08:00:00";
          before = "10:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_lamotrigine_50_1";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your first lamotrigine 50mg";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-lamotrigine-50-1-reminder";
              actions = [
                {
                  action = "lamotrigine_50_1_taken";
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
