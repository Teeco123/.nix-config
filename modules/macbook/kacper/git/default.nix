_: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "teeco123";
      user.email = "teeco.dev@proton.me";
      init.defaultBranch = "main";
      alias = {
        st = "status";
        cam = "commit -a -m";
        p = "push";
      };
    };
  };
}
