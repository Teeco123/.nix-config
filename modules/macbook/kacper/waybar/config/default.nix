_: {
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    height = 40;
    output = [ "eDP-1" ];

    modules-left = [
      "custom/icon"
      "cpu"
      "memory"
    ];
    modules-center = [ ];
    modules-right = [
      "pulseaudio"
      "battery"
      "network"
      "clock"
      "custom/power"
    ];

    "custom/icon" = {
      format = "󱄅 ";
    };

    cpu = {
      interval = 5;
      format = "  {usage:02}%";
    };

    memory = {
      interval = 5;
      format = "  {percentage:02}%";
    };

    battery = {
      format = "{icon} {capacity}%";
      format-icons = {
        default = [
          "󰂎 "
          "󰁺 "
          "󰁻 "
          "󰁼 "
          "󰁽 "
          "󰁾 "
          "󰁿 "
          "󰂀 "
          "󰂁 "
          "󰂂 "
          "󰁹 "
        ];
        charging = [
          "󰢟 "
          "󰢜 "
          "󰂆 "
          "󰂇 "
          "󰂈 "
          "󰢝 "
          "󰂉 "
          "󰢞 "
          "󰂊 "
          "󰂋 "
          "󰂅 "
        ];
      };
    };

    pulseaudio = {
      format = "  {volume}%";
      format-muted = " {volume}%";
    };

    network = {
      interface = "wlan0";
      format-wifi = " ";
      format-disconnected = " ";
    };

    clock = {
      format = "  {:%I:%M%p %d %h}";
      timezone = "Europe/Warsaw";
    };

    "custom/power" = {
      format = "󰐥 ";
      on-click = "poweroff";
    };
  };
}
