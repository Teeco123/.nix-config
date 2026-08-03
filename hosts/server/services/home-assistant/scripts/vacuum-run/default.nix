_: {
  services.home-assistant.config."script vacuum_run" = [
    {
      vacuum_run = {
        alias = "Vacuum run";
        icon = "mdi:robot-vacuum";
        sequence = [
          {
            action = "dreame_vacuum.vacuum_clean_segment";
            target = {
              entity_id = "vacuum.szon_szon";
            };
            data = {
              repeats = 1;
              segments = ''
                {%- set mapping = {
                  'input_boolean.vacuum_corridor': 1,
                  'input_boolean.vacuum_secondary_bedroom': 2,
                  'input_boolean.vacuum_living_room': 3,
                  'input_boolean.vacuum_bathroom': 4,
                  'input_boolean.vacuum_primary_bedroom': 5,
                  'input_boolean.vacuum_kitchen': 6
                } -%}
                {%- set ns = namespace(active_segments=[]) -%}
                {%- for entity, segment_number in mapping.items() if is_state(entity, 'on') -%}
                  {%- set ns.active_segments = ns.active_segments + [segment_number] -%}
                {%- endfor -%}
                {{ ns.active_segments }}
              '';
            };
          }
        ];
      };
    }
  ];
}
