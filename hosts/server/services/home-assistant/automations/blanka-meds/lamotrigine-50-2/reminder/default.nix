_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_lamotrigine_50_2_reminder";
      alias = "Blanka lamotrigine 50mg 2 reminder";
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
          after = "15:00:00";
          before = "16:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_lamotrigine_50_2";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your second lamotrigine 50mg";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-lamotrigine-50-2-reminder";
              actions = [
                {
                  action = "lamotrigine_50_2_taken";
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
