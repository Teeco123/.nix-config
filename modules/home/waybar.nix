{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        output = [ "DP-1" ];

        modules-left = [
          "custom/icon"
          "cpu"
          "memory"
        ];

        modules-center = [ ];

        modules-right = [
          "pulseaudio"
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
          interval = 1;
          format = "  {percentage:02}%";
        };

        pulseaudio = {
          format = "  {volume}%";
          format-muted = " {volume}%";
        };

        network = {
          interface = "enp5s0";
          format-ethernet = "󰈀 ";
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
              font-size: 18px;
              background: none;
              margin: 4px 4px 0px 4px;
              color: #FFFFFF;
            }

            #custom-icon {
              font-size: 24px;
              padding: 3px 8px 3px 17px;
              margin: 4px 0px 4px 4px;
              background: rgba(0,0,0,0.15);
              border-radius: 10px 0px 0px 10px;
            }

            #cpu {
              padding: 3px 15px;
              margin: 4px 0px 4px 0px;
              background: rgba(0,0,0,0.15);
            }

            #memory {
              padding: 3px 15px;
              margin: 4px 4px 4px 0px;
              background: rgba(0,0,0,0.15);
              border-radius: 0px 10px 10px 0px;
            }

            #pulseaudio {
              padding: 3px 15px;
              margin: 4px 0px 4px 0px;
              background: rgba(0,0,0,0.15);
            }

            #network {
              font-size: 20px;
              padding: 3px 10px 3px 15px;
              margin: 4px 0px 4px 0px;
              background: rgba(0,0,0,0.15);
            }

            #clock {
              padding: 3px 15px;
              margin: 4px 0px 4px 0px;
              background: rgba(0,0,0,0.15);
            }

      			#custom-power {
      				font-size: 20px;
              padding: 3px 10px 3px 15px;
              margin: 4px 4px 4px 0px;
              background: rgba(0,0,0,0.15);
              border-radius: 0px 10px 10px 0px;
            }
    '';
  };
}
