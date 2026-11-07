{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      clippy
    ];

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        sqls.enable = true;
        sourcekit.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            check = {
              command = "clippy";
            };
          };
        };
        svelte.enable = true;
        ts_ls.enable = true;
        html.enable = true;
      };
    };
  };
}
