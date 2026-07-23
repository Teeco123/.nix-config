{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    telescope = {
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
  };

  home.packages = with pkgs; [
    ripgrep
    fd
  ];
}
