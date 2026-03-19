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
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Corridor";
          };
        }
        {
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Living Room";
          };
        }
        {
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Kitchen";
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
