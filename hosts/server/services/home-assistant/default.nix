{ lib, pkgs, ... }:
{
  imports = [
    ./zones.nix
    ./scripts
    ./templates
    ./groups
    ./automations
  ];

  sops.secrets = {
    secrets = {
      sopsFile = ../../../../secrets/home-assistant.yaml;
      owner = "hass";
      path = "/var/lib/hass/secrets.yaml";
      restartUnits = [ "home-assistant.service" ];
    };
  };

  services.home-assistant = {
    enable = true;
    openFirewall = true;
    config = {
      homeassistant = {
        name = "!secret zone1_name";
        longitude = "!secret zone1_longitude";
        latitude = "!secret zone1_latitude";
        radius = "!secret zone1_radius";
        temperature_unit = "C";
        time_zone = "Europe/Warsaw";
        unit_system = "metric";
      };

      http = lib.mkForce {
        server_port = 8123;
        use_x_forwarded_for = true;
        trusted_proxies = [ "::1" ];
      };

      weather = { };
      history = { };
      assist_pipeline = { };
      backup = { };
      config = { };
      dhcp = { };
      mobile_app = { };
      my = { };
      ssdp = { };
      sun = { };
      usage_prediction = { };
      usb = { };
      zeroconf = { };
      stream = { };
      wake_on_lan = { };

      lovelace = {
        dashboards = {
          lovelace-home = {
            mode = "yaml";
            filename = "ui-lovelace.yaml";
            title = "Home";
            icon = "mdi:home";
            show_in_sidebar = true;
            require_admin = false;
          };
        };
      };

      "script ui" = "!include scripts.yaml";
      "automation ui" = "!include automations.yaml";
      "scene ui" = "!include scenes.yaml";
    };

    lovelaceConfig = {
      kiosk_mode = {
        hide_sidebar = true;
        hide_header = true;
      };
      views = [
        (import ./ui/main/view.nix)
        (import ./ui/vacuum/view.nix)
        (import ./ui/living-room/view.nix)
        (import ./ui/kitchen/view.nix)
        (import ./ui/corridor/view.nix)
        (import ./ui/bathroom/view.nix)
        (import ./ui/primary-bedroom/view.nix)
        (import ./ui/secondary-bedroom/view.nix)
      ];
    };

    extraComponents = [
      "isal"
      "webostv"
      "zha"
      "mealie"
      "local_calendar"
      "open_meteo"
      "wake_on_lan"
    ];

    customLovelaceModules = with pkgs.home-assistant-custom-lovelace-modules; [
      bubble-card
      navbar-card
      kiosk-mode
    ];

    customComponents = [
      (pkgs.callPackage ./pkgs/dreame.nix {
        pillow = pkgs.python314Packages.pillow;
        numpy = pkgs.python314Packages.numpy;
        pybase64 = pkgs.python314Packages.pybase64;
        requests = pkgs.python314Packages.requests;
        pycryptodome = pkgs.python314Packages.pycryptodome;
        python-miio = pkgs.python314Packages.python-miio;
        paho-mqtt = pkgs.python314Packages.paho-mqtt;
        mini-racer = (pkgs.python314Packages.callPackage ./pkgs/mini-racer.nix { });
      })
    ];
  };
}
