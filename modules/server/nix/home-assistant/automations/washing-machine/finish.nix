{ ... }:

{
  services.home-assistant.config.automation = [
    {
      id = "washing_machine_finish";
      alias = "Washing machine finish washing";
      description = "";
      mode = "single";

      trigger = [
        {
          trigger = "state";
          entity_id = [ "timer.washing_machine_timer" ];
          from = "active";
          to = "idle";
        }
      ];

      action = [
        {
          action = "input_boolean.turn_on";
          target = {
            entity_id = "input_boolean.washing_machine_full";
          };
        }
      ];
    }
  ];
}
