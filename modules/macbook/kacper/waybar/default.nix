_: {
  imports = [
    ./config
  ];

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
  };
}
