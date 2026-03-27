_: {
  networking = {
    hostName = "nixos";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
    };
  };
}
