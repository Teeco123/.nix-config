{ pkgs, ... }:
{
  users = {
    users = {
      kacper = {
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
