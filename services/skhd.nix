{ ... }: {
  services.skhd = {
    enable = true;
    config = ''
      cmd - 1 : yabai -m space --focus browser | yabai -m window --focus "$(yabai -m query --windows | jq 'map(select(.app == "Safari")) | .[0].id')"
      cmd - 2 : yabai -m space --focus terminal | yabai -m window --focus "$(yabai -m query --windows | jq 'map(select(.app == "WezTerm")) | .[0].id')"
      cmd - 3 : yabai -m space --focus imessage | yabai -m window --focus "$(yabai -m query --windows | jq 'map(select(.app == "Messages")) | .[0].id')"
      cmd - 4 : yabai -m space --focus other
    '';
  };
}

