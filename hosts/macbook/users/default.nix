{ pkgs, ... }:
{
  users = {
    users = {
      kacper = {
        shell = pkgs.zsh;
	home = "/Users/kacper";
      };
    };
  };
}
