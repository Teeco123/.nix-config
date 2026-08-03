{
  title = "Vacuum";
  max_columns = 3;
  sections = [
    (import ./map)
    (import ../empty.nix)
    (import ./vacuum-settings)
    (import ../section-navbar.nix)
  ];
}
