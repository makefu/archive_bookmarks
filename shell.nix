{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "scrape-all-env";
  version = "1.1";
  buildInputs = with pkgs; [
    curl
    git
    bash
    xorg.xorgserver
  ] ++ ( with python2Packages; [
    pillow
    zope_interface
    pip
    twisted
    virtualenv
    pyqt5
    six
    requests
    html2text
    pyopenssl
  ]);
    shellHook =''
      HISTFILE="$PWD/.histfile"
      . $PWD/bin/activate
    '' ;
}
