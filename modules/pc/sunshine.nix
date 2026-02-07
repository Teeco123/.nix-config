{ pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    package = pkgs.sunshine.override {
      cudaSupport = true;
    };
    capSysAdmin = true;
    autoStart = true;
    openFirewall = true;
    settings = {
      port = 47989;
    };
  };
}
