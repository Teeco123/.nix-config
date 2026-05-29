{ ... }:

let
  dishwasherFull = "input_boolean.dishwasher_full";
  personSelect = "input_select.dishwasher_unload_person";

  unloadSequence = [
    {
      action = "input_boolean.turn_off";
      target.entity_id = dishwasherFull;
    }
    {
      action = "input_select.select_next";
      data.cycle = true;
      target.entity_id = personSelect;
    }
  ];

  mkCondition = triggerId: [
    {
      condition = "trigger";
      id = [ triggerId ];
    }
    {
      condition = "state";
      entity_id = dishwasherFull;
      state = [ "on" ];
    }
  ];

in
{
  services.home-assistant.config.automation = [
    {
      id = "dishwasher_unloaded";
      alias = "Dishwasher unloaded";
      mode = "single";

      triggers = [
        {
          trigger = "event";
          event_type = "mobile_app_notification_action";
          event_data.action = "dishwasher_unloaded";
          id = "mobile";
        }
        {
          trigger = "tag";
          tag_id = "60490314-a64f-40b2-9b31-173449858c39";
          id = "tag";
        }
      ];

      condition = [ ];

      actions = [
        {
          choose = [
            {
              conditions = mkCondition "tag";
              sequence = unloadSequence;
            }
            {
              conditions = mkCondition "mobile";
              sequence = unloadSequence;
            }
          ];
        }
      ];
    }
  ];
}
