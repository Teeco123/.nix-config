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
            show_state = true;
            show_icon = false;
            state_background = true;
            show_background = true;
            scrolling_effect = true;
            tap_action.action = "none";
            name = "Dishwasher timer";
            show_name = false;
            show_attribute = false;
            show_last_updated = false;
            show_last_changed = false;
            force_icon = false;
            attribute = "duration";
            visibility = [
              {
                condition = "state";
                entity = "timer.dishwasher_timer";
                state = "active";
              }
            ];
          }
        ];
        bottom = [ ];
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "switch";
      entity = "timer.dishwasher_timer";
      name = "Start dishwasher timer";
      show_icon = true;
      scrolling_effect = true;
      show_name = true;
      show_state = false;
      show_last_changed = false;
      show_last_updated = false;
      tap_action = {
        action = "perform-action";
        perform_action = "timer.start";
        target = {
          entity_id = "timer.dishwasher_timer";
        };
      };
      button_action = {
        tap_action = {
          action = "perform-action";
          perform_action = "timer.start";
          target = {
            entity_id = "timer.dishwasher_timer";
          };
        };
      };
      hold_action.action = "none";
      grid_options = {
        columns = 12;
        rows = "auto";
      };
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
      visibility = [
        {
          condition = "state";
          entity = "timer.dishwasher_timer";
          state = "idle";
        }
        {
          condition = "state";
          entity = "input_boolean.dishwasher_full";
          state = "off";
        }
      ];
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "state";
      entity = "input_boolean.dishwasher_full";
      name = "Dishwasher full";
      show_icon = true;
      scrolling_effect = true;
      show_name = true;
      show_state = true;
      show_last_changed = false;
      show_last_updated = false;
      tap_action.action = "none";
      hold_action.action = "toggle";
      button_action.tap_action.action = "none";
      grid_options = {
        columns = 12;
        rows = "auto";
      };
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "state";
      entity = "input_select.dishwasher_unload_person";
      name = "Unload person";
      tap_action.action = "none";
      button_action.tap_action.action = "none";
      grid_options = {
        columns = 12;
        rows = "auto";
      };
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
    }
  ];
}
