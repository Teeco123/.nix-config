{
  lib,
  buildPythonPackage,
  fetchurl,
  autoPatchelfHook,
  stdenv,
  python,
}:

buildPythonPackage rec {
  pname = "mini-racer";
  version = "0.14.0";

  # Tell Nix this is a precompiled binary wheel
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/c1/99/1c1b2c6abc07fc6d22c91582c9d648a9321e6a83c6cdc55970c92c1ad3d0/mini_racer-0.14.0-py3-none-manylinux_2_27_x86_64.whl";
    sha256 = "sha256-tTyV2GsAk7rYBmqmrf9rq7cYmYx/N2+DWXF0rIVwdz8=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  propagatedBuildInputs = [
    python.pkgs.packaging
  ];

  # Python doesn't allow dashes in imports.
  # You use 'mini-racer' in shell, but 'mini_racer' in your code.
  pythonImportsCheck = [ "py_mini_racer" ];

  meta = with lib; {
    description = "PyMiniRacer is a V8 bridge in Python.";
    homepage = "https://github.com/bpcreech/PyMiniRacer";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
}
