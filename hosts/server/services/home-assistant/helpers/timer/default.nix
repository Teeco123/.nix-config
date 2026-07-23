_: {
  services.home-assistant.config.timer = {
    dishwasher_timer = {
      name = "Dishwasher timer";
      duration = 12600;
      restore = true;
    };
  };
}
