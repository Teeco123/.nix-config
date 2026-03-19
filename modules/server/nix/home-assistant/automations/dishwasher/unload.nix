{ ... }:

{
  services.home-assistant.config.automation = [
    {
      id = "unload_dishwasher";
      alias = "Unload dishwasher";
      description = "";
      mode = "single";

      trigger = [
        {
          trigger = "state";
          entity_id = [ "input_boolean.dishwasher_full" ];
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
              entity_id = "input_boolean.dishwasher_full";
              state = "on";
            }
          ];
        }
      ];

      action = [
        {
          choose =
            let
              mkNotifyOption =
                {
                  name,
                  personId,
                  device,
                  isIos ? false,
                }:
                {
                  conditions = [
                    {
                      condition = "and";
                      conditions = [
                        {
                          condition = "state";
                          entity_id = "input_select.dishwasher_unload_person";
                          state = name;
                        }
                        {
                          condition = "state";
                          entity_id = "person.${personId}";
                          state = "home";
                        }
                      ];
                    }
                  ];
                  sequence = [
                    {
                      action = "notify.${device}";
                      data = {
                        title = "Unload dishwasher!";
                        message = "Press and hold to mark dishwasher as unloaded";
                        data = {
                          tag = "unload-dishwasher";
                          actions = [
                            {
                              action = "dishwasher_unloaded";
                              title = "Dishwasher unloaded";
                            }
                          ];
                        }
                        // (
                          if isIos then
                            {
                              push = {
                                interruption-level = "time-sensitive";
                              };
                            }
                          else
                            { }
                        );
                      };
                    }
                  ];
                };
            in
            [
              (mkNotifyOption {
                name = "Kacper";
                personId = "kacper";
                device = "mobile_app_kacper_iphone";
                isIos = true;
              })
              (mkNotifyOption {
                name = "Blanka";
                personId = "blanka";
                device = "mobile_app_blanka_iphone";
                isIos = true;
              })
              (mkNotifyOption {
                name = "Eryk";
                personId = "eryk";
                device = "mobile_app_eryk_samsung";
                isIos = false;
              })
            ];

          default = [
            { stop = ""; }
          ];
        }
      ];
    }
  ];
}
