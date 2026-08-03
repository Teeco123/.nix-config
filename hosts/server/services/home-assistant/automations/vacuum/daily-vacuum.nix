_: {
  services.home-assistant.config.automation = [
    {
      id = "daily_vacuum";
      alias = "Daily vacuum";
      trigger = [
        {
          trigger = "time_pattern";
          minutes = "/5";
        }
      ];
      condition = [
        {
          condition = "time";
          after = "08:00:00";
          before = "21:00:00";
        }
        {
          condition = "state";
          entity_id = "input_boolean.daily_vacuum_done";
          state = "off";
        }
        {
          condition = "state";
          entity_id = "zone.home";
          state = "0";
        }
      ];
      action = [
        {
          action = "dreame_vacuum.vacuum_clean_segment";
          target = {
            entity_id = "vacuum.szon_szon";
          };
          data = {
            segments = [
              3
              6
              1
            ];
          };
        }
        {
          action = "input_boolean.turn_on";
          target.entity_id = "input_boolean.daily_vacuum_done";
        }
      ];
      mode = "single";
    }
  ];
}
