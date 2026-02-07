{ ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    port = 41641;
  };
}
