{
  title = "Bathroom";
  max_columns = 3;
  header = import ./header.nix;
  sections = [
    (import ../section-navbar.nix)
  ];
}
