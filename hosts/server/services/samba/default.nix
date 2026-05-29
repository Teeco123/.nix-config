_: {
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "NixOS Shared Storage";
        "netbios name" = "nixos-server";
        "security" = "user";

        "vfs objects" = "catia fruit streams_xattr";
        "fruit:aapl" = "yes";

        "hosts allow" = "192.168.100. 100.64.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };

      "Public" = {
        "path" = "/mnt/md0/public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0666";
        "directory mask" = "0777";
      };

      "Shared" = {
        "path" = "/mnt/md0/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "valid users" = "@smbusers";
        "force group" = "smbusers";
        "create mask" = "0660";
        "directory mask" = "0770";
      };

      "homes" = {
        "browseable" = "no";
        "read only" = "no";
        "valid users" = "%S";
      };
    };
  };
}
