_: {
  sops = {
    defaultSopsFile = ../../../../secrets/secrets.yaml;
    age = {
      sshKeyPaths = [ "/home/server/.ssh/id_ed25519" ];
      keyFile = "/home/server/.config/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
