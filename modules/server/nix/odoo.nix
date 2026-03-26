{ pkgs, ... }:
let
  pypdf2_legacy = pkgs.python3Packages.buildPythonPackage rec {
    pname = "PyPDF2";
    version = "2.12.1";
    format = "pyproject";

    src = pkgs.python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "e03ef18abcc75da741a0acc1a7749253496887be38cd9887bcce1cee393da45e";
    };

    nativeBuildInputs = [ pkgs.python3Packages.flit-core ];
    doCheck = false;
  };
in
{
  services.odoo = {
    enable = true;
    autoInit = true;
    autoInitExtraFlags = [ "--without-demo=all" ];
    addons = [ ];
    settings = {
      options = {
        list_db = true;
        db_user = "odoo";
        db_password = "odoo";
        admin_password = "odoo";
      };
    };
  };
  systemd.services.odoo.environment.PYTHONPATH = "${pkgs.python3.pkgs.makePythonPath [
    pkgs.python3Packages.phonenumbers
    pypdf2_legacy
  ]}";
}
