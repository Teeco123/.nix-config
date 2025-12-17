{ ... }:
{
  services.borgbackup = {
    jobs = {
      "immich-data" = {
        paths = "/mnt/md0/immich";
        repo = "/mnt/backup/immich-data";
        encryption.mode = "none";
        startAt = "daily";
        compression = "lz4";
      };
    };
  };
}
