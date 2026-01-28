{
  type = "grid";
  column_span = 2;
  cards = [
    {
      type = "custom:bubble-card";
      card_type = "separator";
      name = "Map";
      icon = "mdi:map";
      grid_options.columns = "full";
    }
    {
      type = "map";
      entities = [
        { entity = "person.kacper"; }
        { entity = "person.blanka"; }
        { entity = "person.leszek"; }
        { entity = "person.eryk"; }
      ];
      theme_mode = "auto";
    }
  ];
}
