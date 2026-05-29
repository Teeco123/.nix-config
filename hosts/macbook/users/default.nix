{ pkgs, ... }:
{
  users = {
    users = {
      kacper = {
        isNormalUser = true;
        shell = pkgs.zsh;
        openssh = {
          authorizedKeys = {
            keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILkcbEms0DxLNLonPGR09aLiUyznEQAB/vdEavoTm6nL pc"
            ];
          };
        };
        extraGroups = [
          "wheel"
          "input"
          "docker"
          "networkmanager"
          "pipewire"
          "libvirtd"
        ];
      };
      blanka = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
          "input"
          "docker"
          "networkmanager"
          "pipewire"
          "libvirtd"
        ];
      };
    };
  };
}
