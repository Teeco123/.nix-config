let
  mkPerson =
    {
      person,
      battery,
      distance,
    }:
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "state";
      entity = person;
      show_last_changed = true;
      button_action = { };
      sub_button = {
        main = [
          {
            entity = battery;
            icon = "mdi:battery";
            force_icon = false;
            show_name = false;
            show_last_changed = false;
            show_state = true;
            content_layout = "icon-left";
            hide_when_parent_unavailable = false;
            name = "Battery";
          }
          {
            entity = distance;
            show_name = false;
            show_state = true;
            show_icon = true;
            icon = "mdi:map-marker-distance";
            show_attribute = false;
            show_last_updated = false;
            show_last_changed = false;
          }
        ];
        bottom = [ ];
      };
    };
in
{
  type = "grid";
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "People";
      icon = "mdi:account-multiple";
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
    }
    (mkPerson {
      person = "person.kacper";
      battery = "sensor.kacper_iphone_battery_level";
      distance = "sensor.rycerska_5_kacper_distance";
    })
    (mkPerson {
      person = "person.blanka";
      battery = "sensor.blanka_iphone_battery_level";
      distance = "sensor.rycerska_5_blanka_distance";
    })
    (mkPerson {
      person = "person.eryk";
      battery = "sensor.eryk_samsung_battery_level";
      distance = "sensor.rycerska_5_eryk_distance";
    })
    (mkPerson {
      person = "person.leszek";
      battery = "sensor.leszek_samsung_battery_level";
      distance = "sensor.rycerska_5_leszek_distance";
    })
  ];
}
