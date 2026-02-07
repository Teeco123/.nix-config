{
  services.home-assistant.config.automation = [
    {
      id = "daily_vacuum";
      alias = "Daily vacuum";
      mode = "single";
      trigger = [
        {
          platform = "time";
          at = "11:00:00";
        }
      ];
      condition = [ ];
      action = [
        {
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Corridor";
          };
        }
        {
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Kitchen";
          };
        }
        {
          action = "script.vacuum_run";
          data = {
            vacuum_mode = "Vacuum";
            vacuum_room = "Living Room";
          };
        }
      ];
    }
  ];
}
