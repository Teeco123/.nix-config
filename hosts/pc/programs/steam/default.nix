_: {
  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
    };
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
  };
}
