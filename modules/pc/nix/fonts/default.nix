{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];
}
