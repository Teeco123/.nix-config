{
  services.home-assistant.config.automation = [
    {
      id = "kitchen_led_switch";
      alias = "Kitchen LED switch";
      mode = "restart";
      trigger = [
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_short_press";
          subtype = "turn_on";
          platform = "device";
          id = "on";
        }
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_short_press";
          subtype = "turn_off";
          platform = "device";
          id = "off";
        }
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_long_press";
          subtype = "dim_down";
          platform = "device";
          id = "dim down";
        }
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_long_release";
          subtype = "dim_down";
          platform = "device";
          id = "dim down release";
        }
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_long_press";
          subtype = "dim_up";
          platform = "device";
          id = "dim up";
        }
        {
          device_id = "dabe8242c841576732e08bc9b0d48fba";
          domain = "zha";
          type = "remote_button_long_release";
          subtype = "dim_up";
          platform = "device";
          id = "dim up release";
        }
      ];
      action = [
        {
          choose = [
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [ "on" ];
                }
              ];
              sequence = [
                {
                  action = "light.turn_on";
                  target = {
                    entity_id = "light.led_kitchen";
                  };
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [ "off" ];
                }
              ];
              sequence = [
                {
                  action = "light.turn_off";
                  target = {
                    entity_id = "light.led_kitchen";
                  };
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [ "dim up" ];
                }
              ];
              sequence = [
                {
                  repeat = {
                    until = [
                      {
                        condition = "trigger";
                        id = [ "dim up release" ];
                      }
                    ];
                    sequence = [
                      {
                        action = "light.turn_on";
                        target = {
                          entity_id = "light.led_kitchen";
                        };
                        data = {
                          brightness_step_pct = 5;
                          transition = 1;
                        };
                      }
                    ];
                  };
                }
              ];
            }
            {
              conditions = [
                {
                  condition = "trigger";
                  id = [ "dim down" ];
                }
              ];
              sequence = [
                {
                  repeat = {
                    until = [
                      {
                        condition = "trigger";
                        id = [ "dim down release" ];
                      }
                    ];
                    sequence = [
                      {
                        action = "light.turn_on";
                        target = {
                          entity_id = "light.led_kitchen";
                        };
                        data = {
                          brightness_step_pct = -5;
                          transition = 1;
                        };
                      }
                    ];
                  };
                }
              ];
            }
          ];
        }
      ];
    }
  ];
}
