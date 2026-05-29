_: {
  services.pipewire.extraConfig.pipewire."99-custom-settings" = {
    "context.properties" = {
      "default.clock.allowed-rates" = [
        44100
        48000
        96000
        192000
      ];
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 1024;
      "default.clock.min-quantum" = 1024;
      "default.clock.max-quantum" = 2048;
      "settings.check-quantum" = true;
      "settings.check-rate" = true;
    };
    "context.modules" = [
      {
        name = "libpipewire-module-rt";
        args = {
          "nice.level" = -11;
          "uclamp.min" = 0;
          "uclamp.max" = 128;
        };
        flags = [
          "ifexists"
          "nofail"
        ];
      }
    ];
  };
}
