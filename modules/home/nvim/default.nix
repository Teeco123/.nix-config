{ ... }:
{
  imports = [
    ./cmp.nix
    ./conform.nix
    ./diagnostics.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lint.nix
    ./lsp.nix
    ./lualine.nix
    ./options.nix
    ./telescope.nix
    ./theme.nix
    ./transparent.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
