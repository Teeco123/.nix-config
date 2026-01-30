let
  mkSubButton =
    {
      entity,
      name,
      icon,
      show_state ? false,
      tap_action ? {
        action = "none";
      },
    }:
    {
      inherit
        entity
        name
        icon
        show_state
        tap_action
        ;
      show_icon = true;
      state_background = true;
      show_background = true;
      scrolling_effect = true;
      show_last_updated = false;
      show_attribute = false;
    };

  mkRoomButton =
    {
      name,
      icon,
      path,
      sub_main ? [ ],
      styles ? "",
    }:
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "name";
      inherit name icon;
      sub_button = {
        main = sub_main;
        bottom = [ ];
      };
      tap_action = {
        action = "navigate";
        navigation_path = "/lovelace-home/${path}";
      };
      button_action = {
        tap_action = {
          action = "navigate";
          navigation_path = "/lovelace-home/${path}";
        };
      };
      styles = styles;
    };
in
{
  type = "grid";
  column_span = 1;
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "Rooms";
      icon = "mdi:floor-plan";
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
      grid_options.columns = "full";
    }

    (mkRoomButton {
      name = "Living Room";
      icon = "mdi:sofa";
      path = "2";
      sub_main = [
        (mkSubButton {
          entity = "media_player.lg_b5_oled";
          name = "Temperature";
          icon = "mdi:television";
          tap_action.action = "more-info";
        })
      ];
    })

    (mkRoomButton {
      name = "Kitchen";
      icon = "mdi:fridge";
      path = "3";
      styles = ''
        .bubble-sub-button-1 {
          background-color: ''${hass.states['timer.dishwasher_timer'].state == 'active' ? '#056AB8' : (hass.states['input_boolean.dishwasher_full'].state == 'on' ? '#1DA85E' : '#1C1C1C')} !important;
        }
      '';
      sub_main = [
        (mkSubButton {
          entity = "input_boolean.dishwasher_full";
          name = "Dishwasher full";
          icon = "mdi:dishwasher";
          show_state = false;
        })
        (mkSubButton {
          entity = "light.kitchen_lights";
          name = "Lights";
          icon = "mdi:lightbulb-group";
          tap_action.action = "more-info";
        })
      ];
    })

    (mkRoomButton {
      name = "Corridor";
      icon = "mdi:coat-rack";
      path = "4";
    })

    (mkRoomButton {
      name = "Bathroom";
      icon = "mdi:bathtub";
      path = "5";
      styles = ''
        .bubble-sub-button-1 {
          background-color: ''${hass.states['timer.washing_machine_timer'].state == 'active' ? '#056AB8' : (hass.states['input_boolean.washing_machine_full'].state == 'on' ? '#1DA85E' : '#1C1C1C')} !important;
        }
      '';
      sub_main = [
        (mkSubButton {
          entity = "input_boolean.washing_machine_full";
          name = "Washing machine full";
          icon = "mdi:washing-machine";
          show_state = false;
        })
      ];
    })

    (mkRoomButton {
      name = "Primary Bedroom";
      icon = "mdi:bed-king";
      path = "primary-bedroom";
      sub_main = [
        (mkSubButton {
          entity = "sensor.hum_temp_sensor_primary_bedroom_temperature";
          name = "Temperature";
          icon = "mdi:thermometer";
          show_state = true;
        })
      ];
    })

    (mkRoomButton {
      name = "Secondary Bedroom";
      icon = "mdi:bed-single";
      path = "secondary-bedroom";
    })
  ];
}
