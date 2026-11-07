return {
  colors = {
    foreground = 'white',
    background = 'black',
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  font_size = 18.0,
  enable_tab_bar = false,

  -- Crisp pixel rendering (prevents font smoothing from making lines look thick)
  freetype_load_target = "Mono",
  freetype_render_target = "Mono",

  font = wezterm.font_with_fallback({
    {
      family = "Tiny5 Mono",
      weight = "Regular",
      harfbuzz_features = { "ROND=0", "BLED=0", "JITT=0" },
    },
    "Symbols Nerd Font Mono",
    "Mononoki Nerd Font",
  }),

  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font_with_fallback({
        {
          family = "Tiny5 Mono",
          weight = "Regular",
          harfbuzz_features = { "ROND=0", "BLED=0", "JITT=0" },
        },
        "Symbols Nerd Font Mono",
        "Mononoki Nerd Font",
      }),
    },
  },
  window_background_opacity = 0.6,
}
