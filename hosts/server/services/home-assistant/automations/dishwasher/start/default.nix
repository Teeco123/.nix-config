_:
let
  # Reusable function to check which device scanned the tag
  mkDeviceCondition = deviceIdTemplate: [
    {
      condition = "template";
      value_template = "{{ trigger.event.data.device_id == ${deviceIdTemplate} }}";
    }
  ];

  mkLoadSequence = person: [
    {
      action = "counter.increment";
      target.entity_id = "counter.dishwasher_${person}_load_points";
    }
  ];
in
{
  services.home-assistant.config.automation = [
    {
      id = "start_dishwasher";
      alias = "Dishwasher start";
      mode = "single";
      trigger = [
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "60490314-a64f-40b2-9b31-173449858c39";
          };
        }
      ];
      conditions = [
        {
          condition = "state";
          entity_id = "input_boolean.dishwasher_full";
          state = "off";
          for.seconds = 5;
        }
        {
          condition = "state";
          entity_id = "timer.dishwasher_timer";
          state = "idle";
        }
      ];
      action = [
        {
          action = "timer.start";
          target.entity_id = "timer.dishwasher_timer";
        }
        {
          action = "input_select.select_option";
          target.entity_id = "input_select.dishwasher_unload_person";
          data.option = ''
            {%- set scores = {
              'Kacper': states('counter.dishwasher_kacper_unload_points') | int(0),
              'Blanka': states('counter.dishwasher_blanka_unload_points') | int(0),
              'Eryk': states('counter.dishwasher_eryk_unload_points') | int(0)
            } -%}
            {{- (scores.items() | sort(attribute=1) | first)[0] -}}
          '';
        }
        {
          choose = [
            {
              conditions = mkDeviceCondition "states('input_text.kacper_device_id')";
              sequence = mkLoadSequence "kacper";
            }
            {
              conditions = mkDeviceCondition "states('input_text.blanka_device_id')";
              sequence = mkLoadSequence "blanka";
            }
            {
              conditions = mkDeviceCondition "states('input_text.eryk_device_id')";
              sequence = mkLoadSequence "eryk";
            }
          ];
        }
      ];
    }
  ];
}
