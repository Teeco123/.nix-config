_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_lamotrigine_reminder";
      alias = "Blanka lamotrigine reminder";
      mode = "single";

      trigger = [
        {
          trigger = "time_pattern";
          minutes = "/30";
        }
      ];

      condition = [
        {
          condition = "time";
          after = "18:00:00";
          before = "00:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_lamotrigine";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your lamotrigine";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-lamotrigine-reminder";
              actions = [
                {
                  action = "lamotrigine_taken";
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
