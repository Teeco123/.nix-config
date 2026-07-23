{ pkgs, ... }:
{
  imports = [
    ./cmp
    ./conform
    ./diagnostics
    ./gitsigns
    ./keymaps
    ./lint
    ./lsp
    ./lualine
    ./options
    ./telescope
    ./theme
    ./transparent
    ./treesitter
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
  };
}
