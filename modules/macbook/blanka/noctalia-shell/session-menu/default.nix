_: {
  programs.noctalia-shell.settings.sessionMenu = {
    enableCountdown = true;
    countdownDuration = 3000;
    position = "center";
    showHeader = true;
    showKeybinds = false;
    largeButtonsStyle = false;
    largeButtonsLayout = "single-row";
    powerOptions = [
      {
        action = "lock";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "1";
      }
      {
        action = "suspend";
        command = "";
        countdownEnabled = true;
        enabled = false;
        keybind = "2";
      }
      {
        action = "hibernate";
        command = "";
        countdownEnabled = true;
        enabled = false;
        keybind = "3";
      }
      {
        action = "reboot";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "4";
      }
      {
        action = "logout";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "5";
      }
      {
        action = "shutdown";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "6";
      }
      {
        action = "rebootToUefi";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "7";
      }
    ];
  };
}
