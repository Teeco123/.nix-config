_: {
  hardware = {
    asahi = {
      peripheralFirmwareDirectory = ../../../../hosts/macbook/firmware;
    };
    graphics = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
        Policy = {
          AutoEnable = false;
        };
      };
    };
  };
}
