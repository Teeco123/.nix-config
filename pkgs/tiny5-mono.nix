{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "tiny5-mono";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "Gissio";
    repo = "font_Tiny5Mono";
    rev = "main";
    hash = "sha256-F09oy4x3q2Z9hlbxQTOoKeA39E7Mp0rJKFqurkwUAlM=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -d $out/share/fonts/truetype
    find . -name "*.ttf" -exec install -Dm644 "{}" -t "$out/share/fonts/truetype/" \;
    find . -name "*.otf" -exec install -Dm644 "{}" -t "$out/share/fonts/opentype/" \;

    runHook postInstall
  '';

  meta = with lib; {
    description = "5-pixel monospace variable font for code and terminals";
    homepage = "https://github.com/Gissio/font_Tiny5Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
