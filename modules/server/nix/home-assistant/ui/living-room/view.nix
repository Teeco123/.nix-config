{
  title = "Living Room";
  max_columns = 3;
  sections = [
    (import ./separator.nix)
    (import ./section-tv.nix)
    (import ../section-navbar.nix)
  ];
}
