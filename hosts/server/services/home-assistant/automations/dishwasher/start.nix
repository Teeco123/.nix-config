_: {
  services.home-assistant.config.automation = [
    {
      id = "start_dishwasher";
      alias = "Dishwasher start";
      mode = "single";
      trigger = [
        {
          trigger = "tag";
          tag_id = "60490314-a64f-40b2-9b31-173449858c39";
        }
      ];
      conditions = [
        {
          condition = "state";
          entity_id = "input_boolean.dishwasher_full";
          state = "off";
        }
      ];
      action = [
        {
          action = "timer.start";
          target = {
            entity_id = "timer.dishwasher_timer";
          };
        }
        {
          action = "input_select.select_option";
          target = {
            entity_id = "input_select.dishwasher_unload_person";
          };
          data = {
            option = ''
              {%- set scores = {
                'Kacper': states('counter.dishwasher_kacper_unload_points') | int(0),
                'Blanka': states('counter.dishwasher_blanka_unload_points') | int(0),
                'Eryk': staes('counter.dishwasher_eryk_unload_points') | int(0)
              } -%}
              {{- (scores.items() | sort(attribute=1) | first)[0] -}}
            '';
          };
        }
      ];
    }
  ];
}
