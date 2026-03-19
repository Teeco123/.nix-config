_: {
  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    domain = "vaultwarden.teeco.cc";
    config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
      ADMIN_TOKEN = "$argon2id$v=19$m=65540,t=3,p=4$SnhGVmVqYnFGdzUzUVk2UmRxRzFNQ2owZ1F0ZmhRS2V0dnlXdHROcUlSTT0$ikO7Va0EiGmbZKyJckA
   GRauyV0pVDd6CzmAkylYAkYQ";
    };
  };
}
