{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.kacper = {
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
        ];
      };
      settings = {
        extensions.autoDisableScopes = 0;
      };
    };
  };
}
