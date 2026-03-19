_: {
  sops = {
    defaultSopsFile = ../../../../secrets/kacper.yaml;
    age = {
      sshKeyPaths = [ "/home/kacper/.ssh/id_ed25519" ];
      keyFile = "/home/kacper/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = { };
  };
}
