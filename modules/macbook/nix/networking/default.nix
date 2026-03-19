{ config, ... }:
{
  sops.secrets = {
    wireless-networks = { };
  };

  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
      };
      ensureProfiles = {
        environmentFiles = [ config.sops.secrets.wireless-networks.path ];
        profiles = {
          wifi1 = {
            connection = {
              id = "wifi1";
              type = "wifi";
            };
            wifi = {
              ssid = "$wifi1_ssid";
            };
            wifi-security = {
              auth-alg = "open";
              key-mgmt = "wpa-psk";
              psk = "$wifi1_psk";
            };
          };
        };
      };
    };
    wireless = {
      iwd = {
        enable = true;
        settings.General.EnableNetworkConfiguration = true;
      };
    };
    nameservers = [
      "100.64.0.1"
    ];
  };
}
