{ config, ... }:
{
  sops.secrets = {
    vaultwarden-env = { };
  };

  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    domain = "vaultwarden.teeco.cc";
    environmentFile = config.sops.secrets.vaultwarden-env.path;
    config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
      SMTP_HOST = "smtp.protonmail.ch";
      SMTP_FROM = "server@teeco.cc";
      SMTP_USERNAME = "server@teeco.cc";
    };
  };
}
