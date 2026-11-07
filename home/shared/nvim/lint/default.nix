{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [
          "statix"
        ];
      };
    };

    autoCmd = [
      {
        event = [
          "BufWritePost"
          "BufReadPost"
          "InsertLeave"
        ];
        callback = {
          __raw = ''
            function()
              require('lint').try_lint()
            end
          '';
        };
      }
    ];
  };

  home.packages = with pkgs; [ statix ];
}
