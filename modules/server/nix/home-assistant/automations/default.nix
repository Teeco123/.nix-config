{ ... }:
{
  imports = [
    ./hum-check.nix
    ./kitchen-led-switch.nix
    ./zone-notify/notify-kacper.nix
    ./zone-notify/notify-blanka.nix
    ./daily-vacuum.nix
    ./blanka-mealie-list.nix
  ];
}
