{ pkgs ? import <nixpkgs> {} }:

let
  selenium-52 = pkgs.python3Packages.buildPythonPackage rec {
    name = "selenium-2.53.0";
    src = pkgs.fetchurl {
      url = "mirror://pypi/s/selenium/${name}.tar.gz";
      sha256 = "1qgl2n3cwalxd8s049xd4n5v91xga6qvvk46f0p11kcj6jx6k5ap";
    };

    buildInputs = [pkgs.xorg.libX11];

    # Recompiling x_ignore_nofocus.so as the original one dlopen's libX11.so.6 by some
    # absolute paths. Replaced by relative path so it is found when used in nix.
    x_ignore_nofocus =
      pkgs.fetchFromGitHub {
        owner = "SeleniumHQ";
        repo = "selenium";
        rev = "selenium-2.53.0";
        sha256 = "1dkdm692h9giwgkk34n3hrskssz3i32nk5y3x4pbqf8qv82k7wnc";
      };

    patchPhase = ''
      cp "${x_ignore_nofocus}/cpp/linux-specific/"* .
      substituteInPlace x_ignore_nofocus.c --replace "/usr/lib/libX11.so.6" "${pkgs.xorg.libX11.out}/lib/libX11.so.6"
      gcc -c -fPIC x_ignore_nofocus.c -o x_ignore_nofocus.o
      gcc -shared \
        -Wl,${if pkgs.stdenv.isDarwin then "-install_name" else "-soname"},x_ignore_nofocus.so \
        -o x_ignore_nofocus.so \
        x_ignore_nofocus.o
      cp -v x_ignore_nofocus.so py/selenium/webdriver/firefox/${if pkgs.stdenv.is64bit then "amd64" else "x86"}/
    '';
    doCheck = false;
  };
  commonBuildInputs = [ ];
  commonDoCheck = false;
  python = { mkDerivation = pkgs.python3Packages.buildPythonPackage;};
  generated = pkgs.lib.fix' (import ./requirements_generated.nix
    { inherit pkgs python commonDoCheck commonBuildInputs; });

in pkgs.stdenv.mkDerivation rec {
  name = "scrape-all-env";
  version = "1.1";
  buildInputs = (with pkgs; [
    chromedriver chromium phantomjs
    firefox
    libffi
    openssl


  ]) ++ ( with pkgs.python3Packages; [
    selenium-52
    ipython
    virtualenv
    beautifulsoup4
    lxml
    generated.warcprox
    generated.minibar
    generated.nltk
  ]);
    shellHook =''
      HISTFILE="$PWD/.histfile"
      export CURL_CA_BUNDLE=/etc/ssl/certs/ca-bundle.crt
      export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
      echo 'run `warcprox`'
      echo 'run `sudo docker run -d -p 4444:4444 selenium/standalone-chrome:2.53.0`'
      echo 'run `doit.py`'
    '' ;
}
