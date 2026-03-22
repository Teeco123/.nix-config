_: {
  services.home-assistant.config.automation = [
    {
      id = "blanka_reset_medication";
      alias = "Reset blanka medication";
      mode = "single";

      trigger = [
        {
          trigger = "time";
          at = "00:00:00";
        }
      ];

      action = [
        {
          action = "input_boolean.turn_off";
          target = {
            entity_id = [
              "input_boolean.blanka_magnesium"
              "input_boolean.blanka_omega_3_vitamin_d"
              "input_boolean.blanka_brintelix"
              "input_boolean.blanka_dutilox"
            ];
          };
        }
      ];
    }
  ];
}
