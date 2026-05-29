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
