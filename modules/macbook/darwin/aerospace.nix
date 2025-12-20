{ ... }:
{
  services.aerospace = {
    enable = true;
    settings = {
      gaps = {
        outer.left = 14;
        outer.bottom = 14;
        outer.top = 14;
        outer.right = 14;
      };
      on-window-detected = [
        {
          "if" = {
            app-id = "com.apple.Safari";
          };
          run = "move-node-to-workspace 1";
        }
        {
          "if" = {
            app-id = "com.github.wez.wezterm";
          };
          run = "move-node-to-workspace 2";
        }
      ];
      mode.main.binding = {
        cmd-1 = "workspace 1";
        cmd-2 = "workspace 2";
        cmd-3 = "workspace 3";
      };
    };
  };
}
