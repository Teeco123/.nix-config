{ pkgs, ... }:
{
  imports = [
    ./pipewire-config
    ./wireplumber-config
  ];

  hardware.asahi.setupAsahiSound = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire.overrideAttrs (oldAttrs: rec {
      version = "1.4.10";
      src = pkgs.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "pipewire";
        repo = "pipewire";
        rev = version;
        hash = "sha256-/Av2iXWInsY6S+PdbfCm1AFtHEFt4LXhgRJ6r9lqOpM=";
      };
    });
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
