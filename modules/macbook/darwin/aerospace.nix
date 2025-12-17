{ ... }:
{
  services.aerospace = {
    enable = true;
    settings = {
      gaps = {
        outer.left = 0;
        outer.bottom = 0;
        outer.top = 0;
        outer.right = 0;
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
