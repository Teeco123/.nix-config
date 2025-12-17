{ ... }:
{
  services.prowlarr = {
    enable = true;
    openFirewall = true;
    settings = {
      update = {
        automatically = false;
      };
      server = {
        port = 9696;
      };
    };
  };
}
