_: {
  services.xremap = {
    enable = true;
    withHypr = true;
    config = {
      keymap = [
        {
          name = "macOS Global Keybinds (GUI Apps)";
          application = {
            not = [
              "wezterm"
              "org.wezfurlong.wezterm"
            ];
          };
          remap = {
            # --- Clipboard & Editing ---
            "Super-c" = "Ctrl-c";
            "Super-v" = "Ctrl-v";
            "Super-x" = "Ctrl-x";
            "Super-a" = "Ctrl-a";
            "Super-z" = "Ctrl-z";
            "Super-Shift-z" = "Ctrl-Shift-z";
            "Super-y" = "Ctrl-y";

            # --- File Operations ---
            "Super-s" = "Ctrl-s";
            "Super-Shift-s" = "Ctrl-Shift-s";
            "Super-o" = "Ctrl-o";
            "Super-p" = "Ctrl-p";
            "Super-n" = "Ctrl-n";
            "Super-Shift-n" = "Ctrl-Shift-n";

            # --- Tabs & Windows ---
            "Super-t" = "Ctrl-t";
            "Super-Shift-t" = "Ctrl-Shift-t";
            "Super-w" = "Ctrl-w";
            "Super-Shift-w" = "Ctrl-Shift-w";

            # --- Web Browser & Navigation ---
            "Super-r" = "Ctrl-r";
            "Super-Shift-r" = "Ctrl-Shift-r";
            "Super-l" = "Ctrl-l";
            "Super-d" = "Ctrl-d";
            "Super-Shift-d" = "Ctrl-Shift-d";
            "Super-LeftBrace" = "Alt_L-Left"; # History Back (Cmd+[)
            "Super-RightBrace" = "Alt_L-Right"; # History Forward (Cmd+])
            "Super-Shift-LeftBrace" = "Ctrl-PageUp"; # Previous Tab (Cmd+Shift+[)
            "Super-Shift-RightBrace" = "Ctrl-PageDown"; # Next Tab (Cmd+Shift+])

            # --- Search / Find ---
            "Super-f" = "Ctrl-f";
            "Super-g" = "Ctrl-g";
            "Super-Shift-g" = "Ctrl-Shift-g";

            # --- Zoom Controls ---
            "Super-equal" = "Ctrl-equal";
            "Super-minus" = "Ctrl-minus";
            "Super-0" = "Ctrl-0";

            # --- Text Navigation & Line Jumping ---
            "Super-Left" = "Home";
            "Super-Right" = "End";
            "Super-Up" = "Ctrl-Home";
            "Super-Down" = "Ctrl-End";

            # --- Text Selection (Command + Shift + Arrows) ---
            "Super-Shift-Left" = "Shift-Home";
            "Super-Shift-Right" = "Shift-End";
            "Super-Shift-Up" = "Ctrl-Shift-Home";
            "Super-Shift-Down" = "Ctrl-Shift-End";

            # --- Word Navigation (Option / Left Alt; Alt_R preserved for Polish diacritics) ---
            "Alt_L-Left" = "Ctrl-Left";
            "Alt_L-Right" = "Ctrl-Right";
            "Alt_L-Shift-Left" = "Ctrl-Shift-Left";
            "Alt_L-Shift-Right" = "Ctrl-Shift-Right";

            # --- Deletion ---
            "Super-BackSpace" = [
              "Shift-Home"
              "BackSpace"
            ];
            "Super-Delete" = [
              "Shift-End"
              "Delete"
            ];
            "Alt_L-BackSpace" = "Ctrl-BackSpace";
            "Alt_L-Delete" = "Ctrl-Delete";
          };
        }
        {
          name = "macOS Terminal Keybinds (WezTerm)";
          application = {
            only = [
              "wezterm"
              "org.wezfurlong.wezterm"
            ];
          };
          remap = {
            # --- Clipboard ---
            "Super-c" = "Ctrl-Shift-c";
            "Super-v" = "Ctrl-Shift-v";

            # --- Terminal Navigation & Editing ---
            "Super-k" = "Ctrl-l"; # Clear terminal screen (Cmd+K)
            "Super-Left" = "Home";
            "Super-Right" = "End";
            "Super-BackSpace" = "Ctrl-u"; # Delete line backward
            "Alt_L-BackSpace" = "Ctrl-w"; # Delete word backward
            "Alt_L-Left" = "Ctrl-Left"; # Jump word backward
            "Alt_L-Right" = "Ctrl-Right"; # Jump word forward

            # --- Font Zoom ---
            "Super-equal" = "Ctrl-equal";
            "Super-minus" = "Ctrl-minus";
            "Super-0" = "Ctrl-0";
          };
        }
      ];
    };
  };
}
