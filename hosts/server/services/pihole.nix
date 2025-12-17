{ ... }:
{

  services = {
    pihole-web = {
      enable = true;
      ports = [
        "566r"
        "567s"
      ];
    };
    pihole-ftl = {
      enable = true;
      openFirewallDNS = true;
      openFirewallWebserver = true;
      privacyLevel = 0;
      settings = {
        dns = {
          upstreams = [
            "1.1.1.1"
            "1.0.0.1"
          ];
          hosts = [
            "100.64.0.1 qbittorrent.teeco.cc"
            "100.64.0.1 prowlarr.teeco.cc"
            "100.64.0.1 sonarr.teeco.cc"
            "100.64.0.1 radarr.teeco.cc"
            "100.64.0.1 bazarr.teeco.cc"
          ];
          listeningMode = "ALL";
        };
      };
      lists = [
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/nsfw.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/gambling.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/spam-tlds-adblock-aggressive.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/dyndns.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/tif.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/popupads.txt";
        }
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/fake.txt";
        }
      ];
    };
  };
}
