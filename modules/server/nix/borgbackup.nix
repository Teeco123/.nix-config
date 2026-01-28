{ ... }:
{
  services.borgbackup = {
    jobs = {
      "local" = {
        paths = [ "/mnt/md0/immich" ];
        repo = "/mnt/backup/repo";
        compression = "auto,lz4";
        encryption.mode = "none";
        startAt = "daily";
        prune.keep = {
          daily = 7;
          weekly = 4;
          monthly = 6;
        };
      };
    };
  };
}
