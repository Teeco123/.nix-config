_: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
    kernelParams = [
      "appledrm.show_notch=1"
    ];
  };
}
