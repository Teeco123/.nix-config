[
  {
    type = "custom:bubble-card";
    card_type = "select";
    entity = "select.szon_cleaning_mode";
    name = "Cleaning mode";
    show_attribute = false;
    show_last_updated = false;
    show_last_changed = false;
    show_state = true;
    tap_action = {
      action = "none";
    };
  }
  {
    type = "custom:bubble-card";
    card_type = "select";
    entity = "select.szon_cleaning_route";
    name = "Cleaning route";
    show_attribute = false;
    show_last_updated = false;
    show_last_changed = false;
    show_state = true;
    tap_action = {
      action = "none";
    };
  }
  {
    type = "custom:bubble-card";
    card_type = "button";
    button_type = "name";
    tap_action = {
      action = "perform-action";
      perform_action = "script.vacuum_run";
    };
    name = "Start cleaning";
    icon = "mdi:play";
    button_action = {
      tap_action = {
        action = "perform-action";
        perform_action = "script.vacuum_run";
      };
    };
    visibility = [
      {
        condition = "state";
        attribute = "started";
        entity = "vacuum.szon_szon";
        state = "false";
      }
    ];
  }
]
