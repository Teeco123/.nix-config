{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
      };
      formatters = {
        nixfmt = {
          command = lib.getExe pkgs.nixfmt;
        };
      };
      format_on_save = ''
        				  function(bufnr)
        					  local ft = vim.bo[bufnr].filetype
        						local disable_lsp_fallback = {
             					glsl = true,
        						}
        						return {
        							lsp_fallback = not disable_lsp_fallback[ft],
        							timeout_ms = 500,
        						}
        					end
        				'';
    };
  };
}
