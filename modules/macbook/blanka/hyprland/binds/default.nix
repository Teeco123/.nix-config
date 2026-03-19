_: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER_R, Delete, submap, no-bind"
      "$mainMod, F, fullscreen, 1"
      "$mainMod, Tab, cyclenext"
      "$mainMod, Tab, bringactivetotop"
      "$mainMod, S, togglefloating"
      "$mainMod, Left, movewindow, l"
      "$mainMod, Right, movewindow, r"
      "$mainMod, Up, movewindow, u"
      "$mainMod, Down, movewindow, d"
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
