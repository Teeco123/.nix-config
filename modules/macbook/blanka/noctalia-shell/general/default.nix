_: {
  programs.noctalia-shell.settings.general = {
    avatarImage = "/home/blanka/.face";
    dimmerOpacity = 0;
    showScreenCorners = true;
    forceBlackScreenCorners = true;
    scaleRatio = 1;
    radiusRatio = 1;
    iRadiusRatio = 1;
    boxRadiusRatio = 1;
    screenRadiusRatio = 0;
    animationSpeed = 1;
    animationDisabled = false;
    compactLockScreen = false;
    lockScreenAnimations = false;
    lockOnSuspend = true;
    showSessionButtonsOnLockScreen = true;
    showHibernateOnLockScreen = false;
    enableShadows = true;
    shadowDirection = "bottom_right";
    shadowOffsetX = 2;
    shadowOffsetY = 3;
    language = "";
    allowPanelsOnScreenWithoutBar = true;
    showChangelogOnStartup = false;
    telemetryEnabled = false;
    enableLockScreenCountdown = true;
    lockScreenCountdownDuration = 10000;
    autoStartAuth = false;
    allowPasswordWithFprintd = false;
    clockStyle = "custom";
    clockFormat = "hh\\nmm";
    passwordChars = false;
    lockScreenMonitors = [ ];
    lockScreenBlur = 0;
    lockScreenTint = 0;
    reverseScroll = false;

    keybinds = {
      keyUp = [ "Up" ];
      keyDown = [ "Down" ];
      keyLeft = [ "Left" ];
      keyRight = [ "Right" ];
      keyEnter = [ "Return" ];
      keyEscape = [ "Esc" ];
      keyRemove = [ "Del" ];
    };
  };
}
