{ ... }:

let
  dishwasherFull = "input_boolean.dishwasher_full";
  notificationSequence = [
    {
      action = "input_boolean.turn_off";
      target.entity_id = dishwasherFull;
    }
    {
      action = "counter.increment";
      data.cycle = true;
      target.entity_id = "counter.dishwasher_{{ states('input_select.dishwasher_unload_person') | lower}}_unload_points";
    }
  ];
  tagSequence = [
    {
      action = "input_boolean.turn_off";
      target.entity_id = dishwasherFull;
    }
    {
      action = "counter.increment";
      target.entity_id = "counter.dishwasher_{{ trigger.id }}_unload_points";
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
          id = "notification";
        }
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "60490314-a64f-40b2-9b31-173449858c39";
            device_id = "a86921b3da7525befa2b2412509d5439";
          };
          id = "kacper";
        }
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "60490314-a64f-40b2-9b31-173449858c39";
            device_id = "f1ba98762212463affa9a14a83a38374";
          };
          id = "blanka";
        }
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "60490314-a64f-40b2-9b31-173449858c39";
            device_id = "013c903eee0aec271b7464ab34932d36";
          };
          id = "eryk";
        }
      ];
      condition = [ ];
      actions = [
        {
          choose = [
            {
              conditions = mkCondition "notification";
              sequence = notificationSequence;
            }
            {
              conditions = mkCondition "kacper";
              sequence = tagSequence;
            }
            {
              conditions = mkCondition "blanka";
              sequence = tagSequence;
            }
            {
              conditions = mkCondition "eryk";
              sequence = tagSequence;
            }
          ];
        }
      ];
    }
  ];
}
