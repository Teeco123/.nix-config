{
  title = "Kitchen";
  max_columns = 3;
  header = import ./header.nix;
  sections = [
    (import ./lights.nix)
    (import ./diswasher.nix)
    (import ../section-navbar.nix)
  ];
}
