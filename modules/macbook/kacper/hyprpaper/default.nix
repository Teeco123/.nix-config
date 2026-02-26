_: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.nix-config/wallpapers/zigzag-wave.png" ];
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "~/.nix-config/wallpapers/zigzag-wave.png";
        }
      ];
    };
  };
}
