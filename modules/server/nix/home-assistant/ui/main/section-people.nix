let
  ids = {
    kacper = "cb0729c2021e4d3ea24d04ad25ed9ea6";
    blanka = "56ef46b1fe2b4d78addded7beb7cebad";
    eryk = "a4c874c6f88c47aba85a3429b12de94c";
    leszek = "846b57bc91894f82baed820bd37ee75b";
    wioleta = "5467b7c95b9a4ba3b28f9d0f4f0db072";
  };

  mkPerson =
    {
      person,
      battery,
      distance,
      visibleTo,
    }:
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "state";
      entity = person;
      show_last_changed = true;
      button_action = { };

      visibility = [
        {
          condition = "user";
          users = visibleTo;
        }
      ];

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
    }

    (mkPerson {
      person = "person.kacper";
      battery = "sensor.kacper_iphone_battery_level";
      distance = "sensor.rycerska_5_kacper_distance";
      visibleTo = [
        ids.kacper
        ids.blanka
        ids.eryk
        ids.leszek
        ids.wioleta
      ];
    })

    (mkPerson {
      person = "person.blanka";
      battery = "sensor.blanka_iphone_battery_level";
      distance = "sensor.rycerska_5_blanka_distance";
      visibleTo = [
        ids.kacper
        ids.blanka
        ids.eryk
      ];
    })

    (mkPerson {
      person = "person.eryk";
      battery = "sensor.eryk_samsung_battery_level";
      distance = "sensor.rycerska_5_eryk_distance";
      visibleTo = [
        ids.kacper
        ids.blanka
        ids.eryk
      ];
    })

    (mkPerson {
      person = "person.leszek";
      battery = "sensor.leszek_samsung_battery_level";
      distance = "sensor.rycerska_5_leszek_distance";
      visibleTo = [
        ids.kacper
        ids.leszek
      ];
    })

    (mkPerson {
      person = "person.wioleta";
      battery = "sensor.wioleta_motorola_battery_level";
      distance = "sensor.rycerska_5_wioleta_distance";
      visibleTo = [
        ids.kacper
        ids.wioleta
      ];
    })
  ];
}
