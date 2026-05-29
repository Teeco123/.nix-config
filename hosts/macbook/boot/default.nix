_: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
    kernelParams = [
      "appledrm.show_notch=1"
      "appledrm.force_vrr=1"
    ];
  };
}
