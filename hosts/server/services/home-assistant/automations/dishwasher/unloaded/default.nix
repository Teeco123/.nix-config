_:
let
  dishwasherFull = "input_boolean.dishwasher_full";

  notificationSequence = [
    {
      action = "input_boolean.turn_off";
      target.entity_id = dishwasherFull;
    }
    {
      action = "counter.increment";
      target.entity_id = "counter.dishwasher_{{ states('input_select.dishwasher_unload_person') | lower}}_unload_points";
    }
  ];

  mkTagSequence = person: [
    {
      action = "input_boolean.turn_off";
      target.entity_id = dishwasherFull;
    }
    {
      action = "counter.increment";
      target.entity_id = "counter.dishwasher_${person}_unload_points";
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

  mkDeviceCondition =
    deviceIdTemplate:
    (mkCondition "tag")
    ++ [
      {
        condition = "template";
        value_template = "{{ trigger.event.data.device_id == ${deviceIdTemplate} }}";
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
          };
          id = "tag";
        }
      ];
      actions = [
        {
          choose = [
            {
              conditions = mkCondition "notification";
              sequence = notificationSequence;
            }
            {
              conditions = mkDeviceCondition "states('input_text.kacper_device_id')";
              sequence = mkTagSequence "kacper";
            }
            {
              conditions = mkDeviceCondition "states('input_text.blanka_device_id')";
              sequence = mkTagSequence "blanka";
            }
            {
              conditions = mkDeviceCondition "states('input_text.eryk_device_id')";
              sequence = mkTagSequence "eryk";
            }
          ];
        }
      ];
    }
  ];
}
