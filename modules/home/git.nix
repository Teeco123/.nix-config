{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Kacper Gajko";
      user.email = "kacper.gajko1@icloud.com";
      init.defaultBranch = "main";
      alias = {
        st = "status";
        cam = "commit -a -m";
        p = "push";
      };
    };
  };
}
