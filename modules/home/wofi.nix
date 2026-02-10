{ pkgs, ... }:
{
  programs.wofi = {
    enable = false;
    settings = {
      width = 720;
      height = "20%";
      prompt = "search";
      allow_images = false;
      close_on_focus = true;
      insensitive = true;
      no_actions = true;
    };
  };
}
