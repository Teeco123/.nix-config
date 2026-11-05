_: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Teeco123";
      user.email = "kacper.gajko1@icloud.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      alias = {
        st = "status";
        cam = "commit -a -m";
        p = "push";
      };
    };
  };
}
