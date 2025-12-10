{ ... }:
{
  services = {
    tailscale = {
      enable = true;
      openFirewall = true;
      port = 41641;
    };
    headscale = {
      enable = true;
      user = "headscale";
      group = "headscale";
      port = 36543;
      address = "0.0.0.0";
      settings = {
        server_url = "https://headscale.teeco.cc";
        database = {
          type = "sqlite";
        };
        derp = {
          auto_update_enabled = true;
        };
        dns = {
          magic_dns = true;
          base_domain = "tailnet.teeco.cc";
          nameservers = {
            global = [ "1.1.1.1" ];
          };
        };
      };
    };
  };
}
