{ ... }:
{
  services.home-assistant.config.automation = [
    {
      id = "start_dishwasher";
      alias = "Start dishwasher";
      mode = "single";
      trigger = [
        {
          trigger = "tag";
          tag_id = "60490314-a64f-40b2-9b31-173449858c39";
        }
      ];
      action = [
        {
          action = "timer.start";
          target = {
            entity_id = "timer.dishwasher_timer";
          };
        }
      ];
    }
  ];
}
