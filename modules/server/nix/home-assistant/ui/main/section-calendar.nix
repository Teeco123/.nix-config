{
  type = "grid";
  column_span = 2;
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "Calendar";
      icon = "mdi:calendar";
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
      grid_options = {
        columns = "full";
      };
    }
    {
      type = "custom:bubble-card";
      card_type = "calendar";
      event_action = {
        tap_action = {
          action = "more-info";
        };
        double_tap_action = {
          action = "none";
        };
        hold_action = {
          action = "none";
        };
      };
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
      entities = [
        {
          entity = "calendar.kacper_personal";
          color = "white";
        }
      ];
      visibility = [
        {
          condition = "user";
          users = [
            "cb0729c2021e4d3ea24d04ad25ed9ea6"
          ];
        }
      ];
      grid_options = {
        columns = "full";
        rows = 4;
      };
      days = 7;
      show_end = true;
      show_progress = true;
      show_place = true;
      scrolling_effect = true;
      rows = 1;
    }
  ];
}
