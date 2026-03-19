_: {
  services.dawarich = {
    enable = true;
    webPort = 6281;
    configureNginx = false;
    localDomain = "dawarich.teeco.cc";
    environment = {
      ALLOW_EMAIL_PASSWORD_REGISTRATION = "true";
    };
  };
}
