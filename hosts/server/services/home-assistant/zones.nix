{ lib, ... }: {
  services.home-assistant.config.zone = map (i: {
    name = "!secret zone${toString i}_name";
    latitude = "!secret zone${toString i}_latitude";
    longitude = "!secret zone${toString i}_longitude";
    radius = "!secret zone${toString i}_radius";
  }) (lib.range 2 12);
}
