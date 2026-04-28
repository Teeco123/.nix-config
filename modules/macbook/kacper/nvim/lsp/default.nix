_: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      sqls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      qmlls = {
        enable = true;
        config = {
          cmd = [
            "qmlls"
            "-E"
          ];
        };
      };
    };
  };
}
