{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      wlrobs
      obs-vkcapture
      (
        (pkgs.obs-studio-plugins.droidcam-obs.override {
          ffmpeg_7 = pkgs.ffmpeg;
        }).overrideAttrs
        (prev: {
          version = "2.4.2-unstable-2025-10-14";
          src = pkgs.fetchFromGitHub {
            owner = "dev47apps";
            repo = "droidcam-obs-plugin";
            rev = "161cb95b8dc5fe77185e52a9783dc45c6d137165";
            sha256 = "sha256-3GClykaJjjmasEnSVGU5jnz+xoznaSYTxBz7jkhj0m4=";
          };
        })
      )
    ];
  };
}
