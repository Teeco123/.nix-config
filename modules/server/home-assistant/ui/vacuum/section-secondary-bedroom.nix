let
  mkVacuumSwitch =
    {
      room,
      mode,
      icon,
    }:
    {
      type = "custom:bubble-card";
      card_type = "button";
      button_type = "switch";
      entity = "script.vacuum_run";
      name = "${mode} ${room}";
      inherit icon;
      tap_action = {
        action = "perform-action";
        confirmation = true;
        perform_action = "script.vacuum_run";
        target = { };
        data = {
          vacuum_mode = mode;
          vacuum_room = room;
        };
      };
      button_action = {
        tap_action = {
          action = "perform-action";
          confirmation = true;
          perform_action = "script.vacuum_run";
          target = { };
          data = {
            vacuum_mode = mode;
            vacuum_room = room;
          };
        };
      };
      show_state = false;
      show_last_changed = false;
      show_attribute = false;
      show_last_updated = false;
      force_icon = false;
      sub_button = {
        main = [ ];
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
      name = "Secondary Bedroom";
      icon = "mdi:bed-single";
      sub_button = {
        main = [ ];
        bottom = [ ];
      };
    }
    (mkVacuumSwitch {
      room = "Secondary Bedroom";
      mode = "Vacuum";
      icon = "mdi:vacuum";
    })
    (mkVacuumSwitch {
      room = "Secondary Bedroom";
      mode = "Mop";
      icon = "mdi:water";
    })
  ];
}
