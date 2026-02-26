_: {
  services.pipewire.wireplumber.extraConfig = {
    # 1. Implementation of the DSP and Monitor Rules
    "99-asahi-audio" = {
      "monitor.alsa.rules" = [
        {
          matches = [ { "api.alsa.path" = "~hw:AppleJ[0-9][0-9][0-9],1"; } ];
          actions = {
            update-props = {
              "audio.allowed-rates" = [
                44100
                48000
              ];
              "node.name" = "alsa_output.platform-sound.RawSpeakers";
              "node.description" = "Raw Speaker Device (do not use)";
              "node.nick" = "RawSpeakers";
            };
          };
        }
        {
          matches = [ { "api.alsa.path" = "~hw:AppleJ[0-9][0-9][0-9]HPAI,0"; } ];
          actions = {
            update-props = {
              "node.name" = "alsa_input.platform-sound.RawMics";
              "node.description" = "Raw Mic Device (do not use)";
              "node.nick" = "RawMics";
            };
          };
        }
      ];
      # Mapping your node.software-dsp rules here...
      "node.software-dsp.rules" = [
        {
          matches = [ { "api.alsa.path" = "hw:AppleJ293,1"; } ];
          actions = {
            create-filter = {
              "filter-path" = "/usr/share/asahi-audio/j293/graph.json";
              "hide-parent" = true;
            };
          };
        }
        # ... Repeat for other models (J493, J313, etc.) following this pattern
      ];
    };

    # 2. WirePlumber Components and Profiles
    "99-asahi-components" = {
      "wireplumber.components" = [
        {
          name = "device/asahi-limit-volume.lua";
          type = "script/lua";
          provides = "custom.asahi";
        }
      ];
      "wireplumber.profiles" = {
        main = {
          "custom.asahi" = "required";
          "node.software-dsp" = "required";
        };
      };
    };
  };
}
