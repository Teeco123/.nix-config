{ pkgs, ... }:
{
  users.users = {
    root = {
      openssh = {
        authorizedKeys = {
          keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJbtXScBLJ1wFwcO3L3zrM//Tp/0mz/XzzB6opXAm+/3 macbook"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI/eUChh6jB4vuW71zUBnS7i3hUnQK+AP9IDgs3BVRW macbook"
          ];
        };
      };
    };
    kacper = {
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh = {
        authorizedKeys = {
          keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJbtXScBLJ1wFwcO3L3zrM//Tp/0mz/XzzB6opXAm+/3 macbook"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDI/eUChh6jB4vuW71zUBnS7i3hUnQK+AP9IDgs3BVRW macbook"
          ];
        };
      };
      extraGroups = [
        "wheel"
        "input"
        "uinput"
      ];
    };
    blanka = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
        "uinput"
      ];
    };
  };

  hardware.uinput.enable = true;
}
