{ pkgs, ... }:
let
  tiny5-mono = pkgs.callPackage ../../../pkgs/tiny5-mono.nix { };
in
{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    tiny5-mono
  ];
}
