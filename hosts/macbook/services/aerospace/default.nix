_: {
  services.aerospace = {
    enable = true;

    settings = {
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      gaps = {
        inner.horizontal = 8;
        inner.vertical = 8;
        outer.left = 8;
        outer.bottom = 8;
        outer.top = 8;
        outer.right = 8;
      };

      mode.main.binding = {
        # Switch workspace (Cmd + 1..9)
        "cmd-1" = "workspace 1";
        "cmd-2" = "workspace 2";
        "cmd-3" = "workspace 3";
        "cmd-4" = "workspace 4";
        "cmd-5" = "workspace 5";
        "cmd-6" = "workspace 6";
        "cmd-7" = "workspace 7";
        "cmd-8" = "workspace 8";
        "cmd-9" = "workspace 9";

        # Move current window to workspace (Cmd + Shift + 1..9)
        "cmd-shift-1" = "move-node-to-workspace 1";
        "cmd-shift-2" = "move-node-to-workspace 2";
        "cmd-shift-3" = "move-node-to-workspace 3";
        "cmd-shift-4" = "move-node-to-workspace 4";
        "cmd-shift-5" = "move-node-to-workspace 5";
        "cmd-shift-6" = "move-node-to-workspace 6";
        "cmd-shift-7" = "move-node-to-workspace 7";
        "cmd-shift-8" = "move-node-to-workspace 8";
        "cmd-shift-9" = "move-node-to-workspace 9";

        # Focus windows (Vim keys: Alt + Cmd + H/J/K/L)
        "alt-cmd-h" = "focus left";
        "alt-cmd-j" = "focus down";
        "alt-cmd-k" = "focus up";
        "alt-cmd-l" = "focus right";

        # Move windows within current workspace (Alt + Cmd + Shift + H/J/K/L)
        "alt-cmd-shift-h" = "move left";
        "alt-cmd-shift-j" = "move down";
        "alt-cmd-shift-k" = "move up";
        "alt-cmd-shift-l" = "move right";

        # Workspace back and forth
        "alt-cmd-tab" = "workspace-back-and-forth";

        # Layout toggles
        "alt-cmd-f" = "fullscreen";
        "alt-cmd-slash" = "layout tiles horizontal vertical";
        "alt-cmd-comma" = "layout accordion tiles";
        "alt-cmd-shift-space" = "layout floating tiling";

        # Spawn terminal (WezTerm)
        "alt-cmd-enter" = "exec-and-forget open -n -a WezTerm";

        # Reload configuration
        "alt-cmd-shift-r" = "reload-config";

        # Resize mode
        "alt-cmd-r" = "mode resize";
      };

      mode.resize.binding = {
        "h" = "resize width -50";
        "j" = "resize height +50";
        "k" = "resize height -50";
        "l" = "resize width +50";
        "b" = "balance-sizes";
        "enter" = "mode main";
        "esc" = "mode main";
      };

      # Automatically float dialogs and utility windows
      on-window-detected = [
        {
          "if".app-id = "com.apple.systempreferences";
          run = "layout floating";
        }
        {
          "if".app-id = "com.apple.finder";
          run = "layout floating";
        }
        {
          "if".app-id = "com.apple.archiveutility";
          run = "layout floating";
        }
      ];
    };
  };
}
