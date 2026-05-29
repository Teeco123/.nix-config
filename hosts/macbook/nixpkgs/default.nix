{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (final: prev: {
        # Override the aquamarine package with the master branch
        aquamarine = prev.aquamarine.overrideAttrs (oldAttrs: {
          version = "master";
          src = pkgs.fetchFromGitHub {
            owner = "hyprwm";
            repo = "aquamarine";
            rev = "master"; # Pulls the latest commit on master
            # Leave the hash empty initially; Nix will error out and tell you the correct hash
            sha256 = "sha256-TclWRW2SdFeETLaiTG4BA8C8C4m/LppQEldncqyTzAQ=";
          };
        });
      })
    ];
  };
}
