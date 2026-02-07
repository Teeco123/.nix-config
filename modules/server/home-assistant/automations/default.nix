{ ... }:
{
  imports = [
    ./dishwasher
    ./washing-machine
    ./zone-notify
    ./hum-check.nix
    ./kitchen-led-switch.nix
    ./daily-vacuum.nix
    ./blanka-mealie-list.nix
    ./service-down.nix
  ];
}
