let
  ids = {
    kacper = "cb0729c2021e4d3ea24d04ad25ed9ea6";
    blanka = "56ef46b1fe2b4d78addded7beb7cebad";
    eryk = "a4c874c6f88c47aba85a3429b12de94c";
    leszek = "846b57bc91894f82baed820bd37ee75b";
    wioleta = "5467b7c95b9a4ba3b28f9d0f4f0db072";
  };

  mkMapCard =
    {
      userId,
      entities,
    }:
    {
      type = "map";
      theme_mode = "auto";
      entities = map (e: { entity = e; }) entities;
      visibility = [
        {
          condition = "user";
          users = [ userId ];
        }
      ];
    };

in
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

    (mkMapCard {
      userId = ids.kacper;
      entities = [
        "person.kacper"
        "person.blanka"
        "person.eryk"
        "person.leszek"
        "person.wioleta"
      ];
    })

    (mkMapCard {
      userId = ids.blanka;
      entities = [
        "person.kacper"
        "person.blanka"
        "person.eryk"
      ];
    })

    (mkMapCard {
      userId = ids.eryk;
      entities = [
        "person.kacper"
        "person.blanka"
        "person.eryk"
      ];
    })

    (mkMapCard {
      userId = ids.leszek;
      entities = [
        "person.kacper"
        "person.leszek"
      ];
    })

    (mkMapCard {
      userId = ids.wioleta;
      entities = [
        "person.kacper"
        "person.wioleta"
      ];
    })
  ];
}
