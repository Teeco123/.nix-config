_: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Teeco123";
      user.email = "dastardly7761@proton.me";
      init.defaultBranch = "main";
      alias = {
        st = "status";
        cam = "commit -a -m";
        p = "push";
      };
    };
  };
}
