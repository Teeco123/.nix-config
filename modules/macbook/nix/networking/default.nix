_: {
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
      };
    };
    wireless = {
      iwd = {
        enable = true;
        settings.General.EnableNetworkConfiguration = true;
      };
    };
    nameservers = [
      "100.64.0.1"
    ];
  };
}
