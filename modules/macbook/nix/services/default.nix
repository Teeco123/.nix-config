_: {
  imports = [
    ./tailscale
  ];

  services = {
    upower.enable = true;
    libinput.enable = true;
    gnome.evolution-data-server.enable = true;
  };
}
