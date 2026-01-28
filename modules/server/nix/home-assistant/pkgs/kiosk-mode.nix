{
  lib,
  stdenvNoCC,
  fetchurl,
}:

stdenvNoCC.mkDerivation rec {
  pname = "kiosk-mode";
  version = "9.0.2";

  src = fetchurl {
    url = "https://github.com/NemesisRE/kiosk-mode/releases/download/v${version}/kiosk-mode.js";
    hash = "sha256-hnuJqH82Vjm609acadCk7W690SEj0YHRkcCjntDGdDw=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    cp $src $out/kiosk-mode.js
  '';

  passthru.entrypoint = "kiosk-mode.js";

  meta = with lib; {
    description = "Kiosk Mode for Home Assistant";
    homepage = "https://github.com/NemesisRE/kiosk-mode";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.all;
  };
}
