{ ... }:
{
  services.immich = {
    enable = true;
    port = 2283;
    user = "immich";
    host = "::1";
    mediaLocation = "/mnt/md0/immich";
    openFirewall = true;
    settings = {
      newVersionCheck.enabled = true;
      server.externalDomain = "https://immich.teeco.cc";
      storageTemplate = {
        enabled = true;
        hashVerificationEnabled = true;
        template = "Y-{{y}}/M-{{MM}}/D-{{dd}}/{{assetId}}";
      };
    };
    database = {
      enable = true;
      port = 5432;
      user = "immich";
      name = "immich";
      enableVectorChord = true;
      enableVectors = false;
      createDB = false;
    };
    machine-learning = {
      enable = true;
    };
    redis = {
      enable = true;
      port = 6379;
    };
  };
}
