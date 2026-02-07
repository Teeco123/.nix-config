{ pkgs, ... }:
{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
        sources = [
          {
            name = "nvim_lsp";
          }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
          {
            name = "buffer";
          }
        ];
      };
      autoEnableSources = true;
    };
    cmp-buffer.enable = true;
    cmp-cmdline.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
  };
}
