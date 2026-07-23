{
  type = "grid";
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "Dishwasher";
      icon = "mdi:dishwasher";
      sub_button = {
        main = [
          {
            entity = "timer.dishwasher_timer";
            name = "Dishwasher timer";
            show_state = true;
            tap_action.action = "none";
          }
          {
            entity = "input_boolean.dishwasher_full";
            icon = "mdi:dishwasher-alert";
            name = "Full";
            tap_action.action = "none";
          }
        ];
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "state";
      entity = "input_select.dishwasher_unload_person";
      tap_action = {
        action = "none";
      };
      button_action = {
        tap_action = {
          action = "none";
        };
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "name";
      name = "Load points";
      icon = "mdi:counter";
      rows = 1.719;
      sub_button = {
        bottom = [
          {
            entity = "counter.dishwasher_kacper_load_points";
            show_state = true;
            show_name = true;
            name = "Kacper points";
            tap_action.action = "none";
          }
          {
            entity = "counter.dishwasher_blanka_load_points";
            show_state = true;
            show_name = true;
            name = "Blanka points";
            tap_action.action = "none";
          }
          {
            entity = "counter.dishwasher_eryk_load_points";
            show_state = true;
            show_name = true;
            name = "Eryk points";
            tap_action.action = "none";
          }
        ];
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "name";
      name = "Unload points";
      icon = "mdi:counter";
      rows = 1.719;
      sub_button = {
        bottom = [
          {
            entity = "counter.dishwasher_kacper_unload_points";
            show_state = true;
            show_name = true;
            name = "Kacper points";
            tap_action.action = "none";
          }
          {
            entity = "counter.dishwasher_blanka_unload_points";
            show_state = true;
            show_name = true;
            name = "Blanka points";
            tap_action.action = "none";
          }
          {
            entity = "counter.dishwasher_eryk_unload_points";
            show_state = true;
            show_name = true;
            name = "Eryk points";
            tap_action.action = "none";
          }
        ];
      };
    }
  ];
}
