{ pkgs, ... }:
{
  plugins.web-devicons.enable = true;
  plugins.telescope = {
    enable = true;
    settings = {
      pickers = {
        find_files = {
          find_command = [
            "rg"
            "--files"
            "--hidden"
            "-g"
            "!.git"
          ];
          layout_config = {
            height = 0.70;
          };
        };
      };
    };
  };
}
