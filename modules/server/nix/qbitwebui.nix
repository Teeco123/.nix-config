{ ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    containers."qbitwebui" = {
      image = "ghcr.io/maciejonos/qbitwebui:latest";

      ports = [
        "3000:3000"
      ];

      environment = {
        ENCRYPTION_KEY = "d086fc15dfe52d0ac5218505236276d917e338d8e51bfa9563daba6fbed0c1d5";

        DISABLE_AUTH = "true";
        DISABLE_REGISTRATION = "true";
        ALLOW_SELF_SIGNED_CERTS = "true";
        DOWNLOADS_PATH = "/downloads";
      };

      volumes = [
        "/mnt/md0/media/Downloads:/downloads"
      ];
    };
  };
}
