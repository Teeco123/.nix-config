_: {
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        icon = "rocket";
        iconColor = "none";
        id = "Launcher";
      }
      {
        compactMode = false;
        diskPath = "/";
        iconColor = "none";
        id = "SystemMonitor";
        showCpuFreq = false;
        showCpuTemp = false;
        showCpuUsage = true;
        showDiskAvailable = false;
        showDiskUsage = true;
        showDiskUsageAsPercent = true;
        showGpuTemp = false;
        showLoadAverage = false;
        showMemoryAsPercent = true;
        showMemoryUsage = true;
        showNetworkStats = false;
        showSwapUsage = false;
        textColor = "none";
        useMonospaceFont = true;
        usePadding = false;
      }
      {
        defaultSettings = {
          compactMode = false;
          defaultPeerAction = "copy-ip";
          hideDisconnected = false;
          pingCount = 5;
          refreshInterval = 5000;
          showIpAddress = true;
          showPeerCount = true;
          terminalCommand = "";
        };
        id = "plugin:tailscale";
      }
    ];
    center = [ ];
    right = [
      {
        compactMode = false;
        compactShowAlbumArt = true;
        compactShowVisualizer = false;
        hideMode = "hidden";
        hideWhenIdle = true;
        id = "MediaMini";
        maxWidth = 145;
        panelShowAlbumArt = true;
        panelShowVisualizer = true;
        scrollingMode = "always";
        showAlbumArt = true;
        showArtistFirst = true;
        showProgressRing = false;
        showVisualizer = false;
        textColor = "none";
        useFixedWidth = false;
        visualizerType = "linear";
      }
      {
        displayMode = "alwaysShow";
        iconColor = "none";
        id = "Volume";
        middleClickCommand = "pwvucontrol || pavucontrol";
        textColor = "none";
      }
      {
        displayMode = "onhover";
        iconColor = "none";
        id = "Network";
        textColor = "none";
      }
      {
        deviceNativePath = "__default__";
        displayMode = "graphic";
        hideIfIdle = false;
        hideIfNotDetected = true;
        id = "Battery";
        showNoctaliaPerformance = true;
        showPowerProfiles = true;
      }
      {
        clockColor = "none";
        customFont = "";
        formatHorizontal = "h:mm AP";
        formatVertical = "h:mm";
        id = "Clock";
        tooltipFormat = "HH:mm ddd, MMM dd";
        useCustomFont = false;
      }
      {
        colorizeDistroLogo = false;
        colorizeSystemIcon = "none";
        customIconPath = "";
        enableColorization = false;
        icon = "noctalia";
        id = "ControlCenter";
        useDistroLogo = false;
      }
    ];
  };
}
