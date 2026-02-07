{
  title = "Kitchen";
  max_columns = 3;
  sections = [
    (import ./separator.nix)
    (import ./diswasher.nix)
    (import ../section-navbar.nix)
  ];
}
