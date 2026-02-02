{ lib, pkgs, ... }:
{
  imports = [
    ./zones.nix
    ./scripts
    ./templates
    ./groups
    ./automations
  ];
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    config = {
      homeassistant = {
        name = "!secret home_name";
        longitude = "!secret home_longitude";
        latitude = "!secret home_latitude";
        radius = "!secret home_radius";
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
        mode = "yaml";
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
      "google_generative_ai_conversation"
      "uptime_kuma"
    ];

    customLovelaceModules = with pkgs.home-assistant-custom-lovelace-modules; [
      bubble-card
      navbar-card
      (pkgs.callPackage ./pkgs/kiosk-mode.nix { })
    ];

    customComponents = [
      (pkgs.callPackage ./pkgs/dreame.nix {
        pillow = pkgs.python313Packages.pillow;
        numpy = pkgs.python313Packages.numpy;
        pybase64 = pkgs.python313Packages.pybase64;
        requests = pkgs.python313Packages.requests;
        pycryptodome = pkgs.python313Packages.pycryptodome;
        python-miio = pkgs.python313Packages.python-miio;
        paho-mqtt = pkgs.python313Packages.paho-mqtt;
        mini-racer = (pkgs.python313Packages.callPackage ./pkgs/mini-racer.nix { });
      })
    ];
  };
}
