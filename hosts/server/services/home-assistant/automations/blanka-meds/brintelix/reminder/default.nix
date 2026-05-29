_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_brintelix_reminder";
      alias = "Blanka brintelix reminder";
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
          after = "07:30:00";
          before = "12:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.blanka_brintelix";
          state = [ "off" ];
        }
      ];

      action = [
        {
          action = "notify.mobile_app_blanka_iphone";
          data = {
            title = "Take your brintelix";
            message = "Press and hold to mark as taken";
            data = {
              tag = "blanka-brintelix-reminder";
              actions = [
                {
                  action = "brintelix_taken";
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
