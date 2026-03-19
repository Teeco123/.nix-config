{ ... }:
{
  imports = [
    ./dishwasher
    ./washing-machine
    ./zone-notify
    ./vacuum
    ./hum-check.nix
    ./kitchen-led-switch.nix
    ./blanka-mealie-list.nix
    ./service-down.nix
  ];
}
