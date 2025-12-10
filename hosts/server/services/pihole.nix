{ ... }:
{
  services.pihole-ftl = {
    enable = true;
    openFirewallDNS = true;
    openFirewallWebserver = true;
    privacyLevel = 0;
    lists = {
    };
  };
}
