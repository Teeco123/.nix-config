{ ... }:
{
  imports = [
    ./cmp.nix
    ./gitsigns.nix
    ./transparent.nix
    ./lualine.nix
    ./lsp.nix
    ./conform.nix
    ./keymaps.nix
    ./telescope.nix
    ./treesitter.nix
    ./theme.nix
  ];

  opts = {
    number = true;
    relativenumber = true;
    numberwidth = 2;
    tabstop = 2;
    shiftwidth = 2;
    smartindent = true;
    mouse = "";
    mousescroll = "ver:0,hor:0";
  };
  diagnostic.settings = {
    virtual_text = true;
    signs = false;
    underline = true;
    update_in_insert = false;
    sverity_sort = true;
  };
}
