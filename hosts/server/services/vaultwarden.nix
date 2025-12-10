{ ... }:
{
  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
    };
  };
}
