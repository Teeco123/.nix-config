{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
        return {
          colors = {
            foreground = 'white';
            background = 'black',
          },
          window_padding = {
          	left = 0,
          	right = 0,
          	top = 0,
            bottom = 0,
          },
          font_size = 16,
          enable_tab_bar = false,
          window_background_opacity = 0.6,
      }'';
  };
}
