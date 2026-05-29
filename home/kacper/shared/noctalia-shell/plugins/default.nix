_: {
  programs.noctalia-shell = {
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];

      states = {
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };

      version = 2;
    };
    pluginSettings = {
      tailscale = {
        refreshInterval = 10000;
        compactMode = false;
        showIpAddress = true;
        showPeerCount = true;
        hideDisconnected = false;
        terminalCommand = "wezterm -e";
      };
    };
  };
}
