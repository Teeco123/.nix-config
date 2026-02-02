{ ... }:

{
  services.home-assistant.config.automation = [
    {
      id = "unload_washing_machine";
      alias = "Unload washing machine";
      description = "";
      mode = "single";

      trigger = [
        {
          trigger = "state";
          entity_id = [ "input_boolean.washing_machine_full" ];
          from = "off";
          to = "on";
        }
        {
          trigger = "time_pattern";
          minutes = "/10";
        }
      ];

      condition = [
        {
          condition = "and";
          conditions = [
            {
              condition = "time";
              after = "10:00:00";
              before = "22:00:00";
            }
            {
              condition = "state";
              entity_id = "input_boolean.washing_machine_full";
              state = "on";
            }
          ];
        }
      ];

      action = [
        {
          choose = [
            {
              conditions = [
                {
                  condition = "and";
                  conditions = [
                    {
                      condition = "state";
                      entity_id = "input_select.washing_machine_unload_person";
                      state = "Kacper & blanka";
                    }
                  ];
                }
              ];
              sequence = [
                {
                  "if" = [
                    {
                      condition = "state";
                      entity_id = "person.kacper";
                      state = "home";
                    }
                  ];
                  "then" = [
                    {
                      action = "notify.mobile_app_kacper_iphone";
                      data = {
                        title = "Unload washing machine!";
                        message = "Press and hold to mark washing machine as unloaded";
                        data = {
                          tag = "unload-washing-machine";
                          push = {
                            interruption-level = "time-sensitive";
                          };
                          actions = [
                            {
                              action = "washing_machine_unloaded";
                              title = "Washing machine unloaded";
                            }
                          ];
                        };
                      };
                    }
                  ];
                }
                {
                  "if" = [
                    {
                      condition = "state";
                      entity_id = "person.blanka";
                      state = "home";
                    }
                  ];
                  "then" = [
                    {
                      action = "notify.mobile_app_blanka_iphone";
                      data = {
                        title = "Unload washing machine!";
                        message = "Press and hold to mark washing machine as unloaded";
                        data = {
                          tag = "unload-washing-machine";
                          push = {
                            interruption-level = "time-sensitive";
                          };
                          actions = [
                            {
                              action = "washing_machine_unloaded";
                              title = "Washing machine unloaded";
                            }
                          ];
                        };
                      };
                    }
                  ];
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "and";
                  conditions = [
                    {
                      condition = "state";
                      entity_id = "input_select.washing_machine_unload_person";
                      state = "Eryk";
                    }
                    {
                      condition = "state";
                      entity_id = "person.eryk";
                      state = "home";
                    }
                  ];
                }
              ];
              sequence = [
                {
                  action = "notify.mobile_app_eryk_samsung";
                  data = {
                    title = "Unload washing machine!";
                    message = "Press and hold to mark washing machine as unloaded";
                    data = {
                      tag = "unload-washing-machine";
                      actions = [
                        {
                          action = "washing_machine_unloaded";
                          title = "Washing machine unloaded";
                        }
                      ];
                    };
                  };
                }
              ];
            }
          ];
          default = [
            { stop = ""; }
          ];
        }
      ];
    }
  ];
}
