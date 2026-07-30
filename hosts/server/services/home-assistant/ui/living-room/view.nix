{
  title = "Living Room";
  max_columns = 3;
  header = import ./header.nix;
  sections = [
    (import ./section-tv.nix)
    (import ../section-navbar.nix)
  ];
}
