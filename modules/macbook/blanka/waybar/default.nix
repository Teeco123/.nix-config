_: {
  imports = [
    ./config
  ];

  programs.waybar = {
    enable = false;
    style = builtins.readFile ./style.css;
  };
}
