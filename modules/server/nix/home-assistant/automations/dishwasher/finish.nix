{ ... }:
{
  services.home-assistant.config.automation = [
    {
      id = "dishwasher_finish";
      alias = "Dishwasher finish washing";
      description = "";
      mode = "single";
      trigger = [
        {
          trigger = "state";
          entity_id = [ "timer.dishwasher_timer" ];
          from = "active";
          to = "idle";
        }
      ];
      action = [
        {
          action = "input_boolean.turn_on";
          target = {
            entity_id = "input_boolean.dishwasher_full";
          };
        }
      ];
    }
  ];
}
