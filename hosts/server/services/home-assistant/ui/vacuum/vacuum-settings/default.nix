let
  roomCards = import ./vacuum-rooms-select;
  settingCards = import ./vacuum-settings;
in
{
  type = "grid";
  column_span = 1;
  cards = roomCards ++ settingCards;
}
