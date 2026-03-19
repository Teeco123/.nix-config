_: {
  services.home-assistant.config.automation = [
    {
      id = "vacuum_check";
      alias = "Vacuum check";
      trigger = [
        {
          trigger = "time";
          at = "00:00:00";
        }
      ];
      action = [
        {
          "if" = [
            {
              condition = "state";
              entity_id = "input_boolean.daily_vacuum_done";
              state = "on";
            }
          ];
          "then" = [
            {
              action = "input_boolean.turn_off";
              target.entity_id = "input_boolean.daily_vacuum_done";
            }
            {
              action = "counter.set_value";
              target.entity_id = "counter.days_since_last_daily_vacuum";
              data.value = 0;
            }
          ];
          "else" = [
            {
              action = "counter.increment";
              target.entity_id = "counter.days_since_last_daily_vacuum";
            }
          ];
        }
      ];
      mode = "single";
    }
  ];
}
