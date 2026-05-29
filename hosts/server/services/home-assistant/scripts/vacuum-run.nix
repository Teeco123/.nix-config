{ ... }:
{
  services.home-assistant.config."script vacuum_run" = [
    {
      vacuum_run = {
        alias = "Vacuum run";
        mode = "queued";
        max = 10;
        fields = {
          vacuum_mode = {
            name = "Vacuum Mode";
            required = true;
            selector.select.options = [
              "Vacuum"
              "Mop"
            ];
          };
          vacuum_room = {
            name = "Vacuum Room";
            required = true;
            selector.select.options = [
              "Living Room"
              "Kitchen"
              "Corridor"
              "Bathroom"
              "Primary Bedroom"
              "Secondary Bedroom"
            ];
          };
        };
        sequence = [
          {
            repeat = {
              until = [
                {
                  condition = "device";
                  device_id = "a23388792422d059e30863866941e125";
                  domain = "vacuum";
                  entity_id = "5a83f320a23f1d43d547607213aa059d";
                  type = "is_docked";
                }
              ];
              sequence = [
                {
                  delay = {
                    seconds = 10;
                  };
                }
              ];
            };
          }
          {
            choose = [
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_mode == 'Vacuum' }}";
                  }
                ];
                sequence = [
                  {
                    action = "select.select_option";
                    target.entity_id = "select.roberta_cleaning_mode";
                    data.option = "sweeping";
                  }
                  {
                    action = "select.select_option";
                    target.entity_id = "select.roberta_cleaning_route";
                    data.option = "standard";
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_mode == 'Mop' }}";
                  }
                ];
                sequence = [
                  {
                    action = "select.select_option";
                    target.entity_id = "select.roberta_cleaning_mode";
                    data.option = "mopping";
                  }
                  {
                    action = "select.select_option";
                    target.entity_id = "select.roberta_cleaning_route";
                    data.option = "deep";
                  }
                ];
              }
            ];
            default = [
              {
                stop = "Failed to choose a mode.";
                error = true;
              }
            ];
          }
          {
            choose = [
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Living Room' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 6;
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Kitchen' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 5;
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Corridor' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 3;
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Primary Bedroom' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 1;
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Secondary Bedroom' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 4;
                  }
                ];
              }
              {
                conditions = [
                  {
                    condition = "template";
                    value_template = "{{ vacuum_room == 'Bathroom' }}";
                  }
                ];
                sequence = [
                  {
                    action = "dreame_vacuum.vacuum_clean_segment";
                    target.entity_id = "vacuum.roberta";
                    data.segments = 2;
                  }
                ];
              }
            ];
            default = [
              {
                stop = "Failed to choose a room.";
                error = true;
              }
            ];
          }
        ];
      };
    }
  ];
}
