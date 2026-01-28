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
      sub_main = [
        (mkSubButton {
          entity = "light.kitchen_lights";
          name = "Lights";
          icon = "mdi:lightbulb-group";
          tap_action.action = "more-info";
        })
        (mkSubButton {
          entity = "input_boolean.dishwasher_full";
          name = "Dishwasher full";
          icon = "mdi:dishwasher";
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
