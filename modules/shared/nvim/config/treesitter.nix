{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight = {
        enable = true;
      };
    };
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      nix
      lua
      yaml
      xml
      markdown
      cpp
      c
      css
    ];
  };
}
