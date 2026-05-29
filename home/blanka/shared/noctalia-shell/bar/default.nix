_: {
  imports = [
    ./widgets.nix
  ];

  programs.noctalia-shell.settings.bar = {
    barType = "framed";
    position = "top";
    monitors = [ ];
    density = "default";
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 0.59;
    capsuleColorKey = "none";
    widgetSpacing = 3;
    fontScale = 1;
    backgroundOpacity = 0.65;
    useSeparateOpacity = true;
    floating = false;
    marginVertical = 0;
    marginHorizontal = 2;
    frameThickness = 8;
    frameRadius = 13;
    outerCorners = true;
    hideOnOverview = false;
    displayMode = "always_visible";
    autoHideDelay = 500;
    autoShowDelay = 150;
    showOnWorkspaceSwitch = true;
  };
}
