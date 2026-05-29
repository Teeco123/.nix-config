{
  title = "Vacuum";
  max_columns = 3;
  sections = [
    (import ./section-map.nix)
    (import ./section-living-room.nix)
    (import ./section-corridor.nix)
    (import ./section-kitchen.nix)
    (import ./section-bathroom.nix)
    (import ./section-primary-bedroom.nix)
    (import ./section-secondary-bedroom.nix)
    (import ../section-navbar.nix)
  ];
}
