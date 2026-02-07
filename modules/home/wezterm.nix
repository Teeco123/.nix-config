{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
                                return {
      														colors = {
      															background = "black",
      															foreground = "white",
      														},
                                  window_padding = {
                                  	left = 0,
                                  	right = 0,
                                  	top = 0,
                                    bottom = 0,
                                  },
                                  font_size = 16,
                                	text_background_opacity = 1,
                                	window_background_opacity = 0.3,
                                	use_fancy_tab_bar = true,
                              }'';
  };
}
