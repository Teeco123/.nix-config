{
  type = "grid";
  cards = [
    {
      type = "custom:navbar-card";
      routes = [
        {
          icon = "mdi:home";
          label = "Home";
          url = "/lovelace-home/0";
        }
        {
          icon = "mdi:robot-vacuum";
          label = "Vacuum";
          url = "/lovelace-home/1";
        }
      ];
      desktop = {
        position = "left";
        show_labels = true;
        show_popup_label_backgrounds = true;
      };
      mobile = {
        mode = "docked";
        show_labels = true;
        show_popup_label_backgrounds = true;
      };
      haptic = {
        url = true;
        tap_action = true;
        hold_action = true;
        double_tap_action = true;
      };
    }
  ];
}
