{ lib, pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        css = [ "prettierd" ];
      };
      formatters = {
        nixfmt = {
          command = lib.getExe pkgs.nixfmt;
        };
        prettierd = {
          command = lib.getExe pkgs.prettierd;
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
