{ config, ... }: {
  system.defaults.screencapture = {
    location = "~/Pictures/Screenshots";
  };

  system.activationScripts.postActivation.text = ''
    # Disable macOS screenshot shortcuts (Cmd + Shift + 3, 4, 5) that conflict with AeroSpace window management
    launchctl asuser "$(id -u -- ${config.system.primaryUser})" sudo --user=${config.system.primaryUser} -- defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 28 '<dict><key>enabled</key><false/></dict>'
    launchctl asuser "$(id -u -- ${config.system.primaryUser})" sudo --user=${config.system.primaryUser} -- defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 30 '<dict><key>enabled</key><false/></dict>'
    launchctl asuser "$(id -u -- ${config.system.primaryUser})" sudo --user=${config.system.primaryUser} -- defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 184 '<dict><key>enabled</key><false/></dict>'
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}

