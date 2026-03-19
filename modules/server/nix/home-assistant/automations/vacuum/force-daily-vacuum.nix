_: {
  services.home-assistant.config.automation = [
    {
      id = "force_daily_vacuum";
      alias = "Force daily vacuum";
      trigger = [
        {
          trigger = "time";
          at = "15:00:00";
        }
      ];
      condition = [
        {
          condition = "state";
          entity_id = "counter.days_since_last_daily_vacuum";
          state = "2";
        }
        {
          condition = "state";
          entity_id = "input_boolean.daily_vacuum_done";
          state = "off";
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
        {
          action = "counter.set_value";
          target.entity_id = "counter.days_since_last_daily_vacuum";
          data.value = 0;
        }
      ];
      mode = "single";
    }
  ];
}
