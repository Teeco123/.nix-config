_: {
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    port = 3729;
    allowDHCP = true;
    settings = {
      dns = {
        upstream_dns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
        cache_size = 20971520;
        cache_ttl_min = 0;
        cache_ttl_max = 0;
        cache_optimistic = true;
      };
      filtering = {
        protection_enabled = true;
        filtering_enabled = true;
        blocking_mode = "default";
        parental_enabled = false;
        safebrowsing_enabled = false;
        safe_search = {
          enabled = false;
          google = false;
          bing = false;
          duckduckgo = false;
          youtube = false;
        };
      };
      querylog = {
        enabled = true;
        file_enabled = true;
        interval = "2160h";
        size_memory = 1000;
        ignored = [ ];
      };
      statistics = {
        enabled = true;
        interval = "8760h";
        ignored = [ ];
      };
      filters = [
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt";
          name = "AdGuard DNS filter";
          id = 1;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt";
          name = "AdAway Default Blocklist";
          id = 2;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/fake.txt";
          name = "Fake";
          id = 3;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/popupads.txt";
          name = "Pop-Ups";
          id = 4;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/tif.txt";
          name = "Threat Intelligence Feeds";
          id = 5;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/dyndns.txt";
          name = "DynDNS";
          id = 6;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adguard/dns-rebind-protection.txt";
          name = "DNS rebind";
          id = 7;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/gambling.txt";
          name = "Gambling";
          id = 8;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/nsfw.txt";
          name = "NSFW";
          id = 9;
        }
        {
          enabled = true;
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt";
          name = "Multi PRO";
          id = 10;
        }
      ];
      tls = {
        enabled = false;
      };
      dhcp = {
        enabled = true;
        interface_name = "enp1s0";
        dhcpv4 = {
          gateway_ip = "192.168.100.1";
          subnet_mask = "255.255.255.0";
          range_start = "192.168.100.3";
          range_end = "192.168.100.254";
          lease_duration = 86400;
        };
      };
      clients = {
        runtime_sources = {
          whois = true;
          arp = true;
          rdns = true;
          dhcp = true;
          hosts = true;
        };
        persistent = [
          {
            name = "server";
            use_global_settings = true;
            ids = [
              "100.64.0.1"
              "192.168.100.2"
            ];
            tags = [
              "device_nas"
              "os_linux"
              "user_admin"
            ];
          }
          {
            name = "kacper-iphone";
            use_global_settings = true;
            ids = [
              "100.64.0.2"
              "192.168.100.3"
            ];
            tags = [
              "device_phone"
              "os_ios"
              "user_admin"
            ];
          }
          {
            name = "kacper-macbook";
            use_global_settings = true;
            ids = [
              "100.64.0.3"
              "192.168.100.4"
            ];
            tags = [
              "device_laptop"
              "os_linux"
              "user_admin"
            ];
          }
          {
            name = "blanka-iphone";
            use_global_settings = true;
            ids = [
              "100.64.0.4"
              "192.168.100.9"
            ];
            tags = [
              "device_phone"
              "os_ios"
              "user_regular"
            ];
          }
          {
            name = "blanka-ipad";
            use_global_settings = true;
            ids = [
              "100.64.0.5"
              "192.168.100.5"
            ];
            tags = [
              "device_tablet"
              "os_ios"
              "user_regular"
            ];
          }
          {
            name = "eryk-samsung";
            use_global_settings = false;
            filtering_enabled = false;
            ids = [
              "100.64.0.8"
              "192.168.100.6"
            ];
            tags = [
              "device_phone"
              "os_android"
              "user_regular"
            ];
          }
          {
            name = "eryk-laptop";
            use_global_settings = false;
            filtering_enabled = false;
            ids = [
              "100.64.0.7"
              "192.168.100.7"
            ];
            tags = [
              "device_laptop"
              "os_windows"
              "user_regular"
            ];
          }
          {
            name = "eryk-pc";
            use_global_settings = false;
            filtering_enabled = false;
            ids = [
              "192.168.100.15"
            ];
            tags = [
              "device_pc"
              "os_windows"
              "user_regular"
            ];
          }
          {
            name = "lg-tv";
            use_global_settings = true;
            ids = [
              "192.168.100.11"
            ];
            tags = [
              "device_tv"
              "os_other"
              "user_regular"
            ];
          }
          {
            name = "dreame-vacuum";
            use_global_settings = true;
            ids = [
              "192.168.100.8"
            ];
            tags = [
              "device_other"
              "os_other"
              "user_regular"
            ];
          }
          {
            name = "wioleta-motorola";
            use_global_settings = true;
            ids = [
              "100.64.0.9"
              "192.168.100.12"
            ];
            tags = [
              "device_phone"
              "os_android"
              "user_regular"
            ];
          }
        ];
      };
    };
  };
}
