_: {
  services.hyprpaper = {
    enable = false;
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
