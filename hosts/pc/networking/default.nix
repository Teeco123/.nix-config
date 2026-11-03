_: {
  networking = {
    hostName = "pc";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
    };
  };
}
