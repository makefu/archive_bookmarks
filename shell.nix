{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "scrape-all-env";
  version = "1.1";
  buildInputs = (with pkgs; [
    curl
    git
    bash
    xorg.xorgserver
  ]) ++ ( with pkgs.python2Packages; [
    pillow
    zope_interface
    pip
    twisted
    virtualenv
    pyqt5
    six
    pyopenssl
    requests2
    beautifulsoup4
    pillow
    docopt
  ]);
    shellHook =''
      HISTFILE="$PWD/.histfile"
      if test -e bin/activate ;then
        . bin/activate
      else
        virtualenv .
        . bin/activate
        pip install splash warcprox minibar
      fi
      echo 'run `warcprox`'
      echo 'run `splash --proxy-profiles-path=proxies`'
    '' ;
}
