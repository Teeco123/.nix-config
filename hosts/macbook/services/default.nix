_: {
  imports = [
    ./gnome
    ./upower
    ./libinput
    ./tailscale
    ./openssh
  ];

  services.desktopManager.plasma6.enable = true;
}
