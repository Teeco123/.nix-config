{ ... }:
{
  services.home-assistant.config.zone = [
    {
      name = "!secret khome_name";
      latitude = "!secret khome_latitude";
      longitude = "!secret khome_longitude";
      radius = "!secret khome_radius";
    }
    {

      name = "!secret pollub_name";
      latitude = "!secret pollub_latitude";
      longitude = "!secret pollub_longitude";
      radius = "!secret pollub_radius";
    }
    {
      name = "!secret biedronka_name";
      latitude = "!secret biedronka_latitude";
      longitude = "!secret biedronka_longitude";
      radius = "!secret biedronka_radius";
    }
    {
      name = "!secret blanpsych_name";
      latitude = "!secret blanpsych_latitude";
      longitude = "!secret blanpsych_longitude";
      radius = "!secret blanpsych_radius";
    }
    {
      name = "!secret venus_name";
      latitude = "!secret venus_latitude";
      longitude = "!secret venus_longitude";
      radius = "!secret venus_radius";
    }
    {
      name = "!secret prawiedniki_name";
      latitude = "!secret prawiedniki_latitude";
      longitude = "!secret prawiedniki_longitude";
      radius = "!secret prawiedniki_radius";
    }
  ];
}
