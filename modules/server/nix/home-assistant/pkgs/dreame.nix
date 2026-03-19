{
  stdenv,
  pkgs,
  fetchFromGitHub,
  buildHomeAssistantComponent,
  pillow,
  numpy,
  pybase64,
  requests,
  pycryptodome,
  python-miio,
  paho-mqtt,
  mini-racer,
}:

buildHomeAssistantComponent rec {

  owner = "Tasshack";
  domain = "dreame_vacuum";
  version = "2.0.0b21";

  src = fetchFromGitHub {
    owner = "Tasshack";
    repo = "dreame-vacuum";
    rev = "v${version}";
    sha256 = "sha256-mEpKvMNoZY25MLR+KwYbKUcZU/Bn4B9UuC2t2hNgPUI=";
  };

  propagatedBuildInputs = [
    pillow
    numpy
    pybase64
    requests
    pycryptodome
    python-miio
    paho-mqtt
    mini-racer
  ];

}
