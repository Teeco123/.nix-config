_: {
  services.jellyfin = {
    enable = true;
    user = "jellyfin";
    group = "media";
    openFirewall = true;
    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };
    transcoding = {
      enableHardwareEncoding = true;
      enableIntelLowPowerEncoding = false;
      hardwareDecodingCodecs = {
        h264 = true;
        hevc = true;
        mpeg2 = true;
        vc1 = true;
        vp8 = true;
        vp9 = true;
        av1 = false;
        hevc10bit = true;
        hevcRExt10bit = true;
        hevcRExt12bit = false;
      };
      hardwareEncodingCodecs = {
        hevc = true;
        av1 = false;
      };
    };
  };
}
