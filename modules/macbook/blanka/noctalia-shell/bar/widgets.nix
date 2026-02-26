_: {
  programs.noctalia-shell.settings.bar.widgets = {
    left = [ ];
    center = [ ];
    right = [
      {
        id = "MediaMini";
        compactMode = false;
        compactShowAlbumArt = true;
        compactShowVisualizer = false;
        hideMode = "hidden";
        hideWhenIdle = true;
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
        id = "Volume";
        displayMode = "alwaysShow";
        iconColor = "none";
        middleClickCommand = "pwvucontrol || pavucontrol";
        textColor = "none";
      }
      {
        id = "Network";
        displayMode = "onhover";
        iconColor = "none";
        textColor = "none";
      }
      {
        id = "Battery";
        deviceNativePath = "__default__";
        displayMode = "graphic";
        hideIfIdle = false;
        hideIfNotDetected = true;
        showNoctaliaPerformance = true;
        showPowerProfiles = true;
      }
      {
        id = "Clock";
        clockColor = "none";
        customFont = "";
        formatHorizontal = "h:mm AP";
        formatVertical = "h:mm";
        tooltipFormat = "HH:mm ddd, MMM dd";
        useCustomFont = false;
      }
      {
        id = "ControlCenter";
        colorizeDistroLogo = false;
        colorizeSystemIcon = "none";
        customIconPath = "";
        enableColorization = false;
        icon = "noctalia";
        useDistroLogo = false;
      }
    ];
  };
}
