_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_lamotrigine_100_3_reminder";
      alias = "Blanka lamotrigine 100mg 3 reminder";
      mode = "single";

      trigger = [
        {
          trigger = "time_pattern";
          minutes = "/20";
        }
      ];

      condition = [
        {
          condition = "time";
          after = "22:00:00";
          before = "23:59:59";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_lamotrigine_100_3";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your third lamotrigine 100mg";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-lamotrigine-100-3-reminder";
              actions = [
                {
                  action = "lamotrigine_100_3_taken";
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
