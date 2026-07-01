_: {
  imports = [
    ./widgets.nix
  ];

  programs.noctalia-shell.settings.bar = {
    barType = "floating";
    position = "top";
    monitors = [ ];
    density = "default";
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 0.7;
    capsuleColorKey = "none";
    widgetSpacing = 8;
    fontScale = 1;
    backgroundOpacity = 1;
    useSeparateOpacity = true;
    floating = true;
    marginVertical = 0;
    marginHorizontal = 2;
    frameThickness = 8;
    frameRadius = 12;
    outerCorners = true;
    hideOnOverview = false;
    displayMode = "always_visible";
    autoHideDelay = 500;
    autoShowDelay = 150;
    showOnWorkspaceSwitch = true;
  };
}
