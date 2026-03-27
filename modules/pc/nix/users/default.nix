{ pkgs, ... }:
{
  users.users = {
    kacper = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
      ];
    };
    blanka = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
      ];
    };
  };
}
