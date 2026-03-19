{
  title = "Home";
  max_columns = 3;
  badges = (import ./badges.nix);
  sections = [
    (import ./section-map.nix)
    (import ./section-people.nix)
    (import ./section-calendar.nix)
    (import ./section-rooms.nix)
    (import ../section-navbar.nix)
  ];
}
