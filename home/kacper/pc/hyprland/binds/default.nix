_: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER_R, Delete, submap, no-bind"
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod, F, fullscreen"
      "$mainMod, Tab, cyclenext"
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      ", XF86Search, exec, $ns-ipc launcher toggle"
      "$mainMod, M, exit"
      "$mainMod, Q, killactive"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bindel = [
      ", XF86AudioRaiseVolume, exec, $ns-ipc volume increase"
      ", XF86AudioLowerVolume, exec, $ns-ipc volume decrease"
      ", XF86MonBrightnessUp, exec, $ns-ipc brightness increase"
      ", XF86MonBrightnessDown, exec, $ns-ipc brightness decrease"
    ];
  };
}
