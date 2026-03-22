_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_magnesium_reminder";
      alias = "Blanka magnesium reminder";
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
          after = "20:00:00";
          before = "22:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_magnesium";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your magnesium";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-magnesium-reminder";
              actions = [
                {
                  action = "magnesium_taken";
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
