{ ... }:

{
  services.home-assistant.config.automation = [
    {
      id = "start_washing_machine";
      alias = "Start washing machine";
      description = "";
      mode = "single";

      trigger = [
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "305bacaf-15cc-4e63-a434-b22e5220a346";
            device_id = "a86921b3da7525befa2b2412509d5439";
          };
          id = "kacper";
        }
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "305bacaf-15cc-4e63-a434-b22e5220a346";
            device_id = "f1ba98762212463affa9a14a83a38374";
          };
          id = "blanka";
        }
        {
          trigger = "event";
          event_type = "tag_scanned";
          event_data = {
            tag_id = "305bacaf-15cc-4e63-a434-b22e5220a346";
            device_id = "f1ga98762612463afka9a14a83a32374";
          };
          id = "eryk";
        }
      ];

      action = [
        {
          choose = [
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [
                    "kacper"
                    "blanka"
                  ];
                }
              ];
              sequence = [
                {
                  action = "input_select.select_option";
                  target = {
                    entity_id = "input_select.washing_machine_unload_person";
                  };
                  data = {
                    option = "Kacper & blanka";
                  };
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [ "eryk" ];
                }
              ];
              sequence = [
                {
                  action = "input_select.select_option";
                  target = {
                    entity_id = "input_select.washing_machine_unload_person";
                  };
                  data = {
                    option = "Eryk";
                  };
                }
              ];
            }
          ];
        }
        {
          action = "timer.start";
          target = {
            entity_id = "timer.washing_machine_timer";
          };
        }
      ];
    }
  ];
}
