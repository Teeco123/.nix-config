{
  type = "grid";
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "media-player";
      entity = "media_player.lg_b5_oled";
      cover_background = false;
      tap_action = {
        action = "more-info";
      };
      button_action = {
        tap_action = {
          action = "more-info";
        };
      };
      sub_button = {
        main = [
          {
            name = "Turn on";
            icon = "mdi:power";
            hide_when_parent_unavailable = false;
            visibility = [
              {
                condition = "state";
                entity = "media_player.lg_b5_oled";
                state = "unavailable";
              }
            ];
            tap_action = {
              action = "call-service";
              target = { };
              service = "wake_on_lan.send_magic_packet";
              data = {
                mac = "1C:F4:3F:10:2E:EC";
              };
            };
          }
        ];
        bottom = [ ];
      };
    }
  ];
}
