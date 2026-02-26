{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
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
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
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
    };

    style = ''
                  * {
                    border: none;
                    font-family: monospace;
                    font-size: 16px;
                    background: none;
                    margin: 4px 4px 0px 4px;
                    color: #FFFFFF;
                  }

                  #custom-icon {
                    font-size: 22px;
                    padding: 3px 8px 3px 17px;
                    margin: 4px 0px 4px 4px;
                    background: none;
                  }

                  #cpu {
                    padding: 3px 15px;
                    margin: 4px 0px 4px 0px;
                    background: none;
                  }

                  #memory {
                    padding: 3px 15px;
                    margin: 4px 4px 4px 0px;
                    background: none;
                  }

                  #pulseaudio {
                    padding: 3px 15px;
                    margin: 4px 0px 4px 0px;
                    background: none;
                  }

      						#battery {
      							padding: 3px 15px;
      							margin: 4px 0px 4px 0px;
      							background: none;
      						}

                  #network {
                    font-size: 18px;
                    padding: 3px 10px 3px 15px;
                    margin: 4px 0px 4px 0px;
                    background: none;
                  }

                  #clock {
                    padding: 3px 15px;
                    margin: 4px 0px 4px 0px;
                    background: none;
                  }

            			#custom-power {
            				font-size: 18px;
                    padding: 3px 10px 3px 15px;
                    margin: 4px 4px 4px 0px;
                    background: none;
                  }
    '';
  };
}
