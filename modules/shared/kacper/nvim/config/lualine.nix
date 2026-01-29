{ pkgs, ... }:
{
  plugins.lualine = {
    enable = false;
    settings = {
      options = {
        always_divide_middle = true;
        icons_enabled = true;
        globalstatus = true;
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "fileformat";
            symbols = {
              unix = "󱄅";
              dos = "";
              mac = "";
            };
          }
          {
            __unkeyed-1 = "mode";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "cwd";
            __unkeyed-2 = ''
              fmt = function()
              							local cwd = vim.fn.getcwd()
              							local last_dir = cwd:match("([^/\\]+)$")
              							return last_dir
              							end'';
          }
          {
            __unkeyed-1 = "filename";
            __unkeyed-2 = "branch";
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "lsp_status";
          }
          {
            __unkeyed-1 = "filetype";
            colored = false;
            icon_only = false;
            icon.align = "left";
          }
        ];
        lualine_y = [ "location" ];
        lualine_z = [ "os.date('%I:%M %p')" ];
      };
    };
  };
}
