# generated using pypi2nix tool (version: 1.4.0.dev0)
#
# COMMAND:
#   pypi2nix -V 2.7 -r REQS.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "certauth" = python.mkDerivation {
    name = "certauth-1.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f9/20/3b34db694bb8e89e763dd42c5bbc89db29634e24cb4c880a4d7c9863dd1a/certauth-1.1.3.tar.gz";
      sha256= "64a2cd09870377dd2601353969617ebb424d94a8ab21d5ccdb93b9bf41cf3578";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      pkgs.python35Packages.pyopenssl
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Simple Certificate Authority for MITM proxies";
    };
  };



  "enum34" = python.mkDerivation {
    name = "enum34-1.1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz";
      sha256= "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
    };
  };



  "idna" = python.mkDerivation {
    name = "idna-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz";
      sha256= "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Internationalized Domain Names in Applications (IDNA)";
    };
  };



  "ipaddress" = python.mkDerivation {
    name = "ipaddress-1.0.17";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bb/26/3b64955ff73f9e3155079b9ed31812afdfa5333b5c76387454d651ef593a/ipaddress-1.0.17.tar.gz";
      sha256= "3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.psfl;
      description = "IPv4/IPv6 manipulation library";
    };
  };



  "minibar" = python.mkDerivation {
    name = "minibar-0.5.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/12/34/f1d8396d246f9649e164208d9c28e3c2bdb91077c59f86368b10fba36324/minibar-0.5.0.tar.gz";
      sha256= "da7d1f8ccf4e7fe3b9952ab9dc6f9cee308f52a8c0903747a606c4d8b0353a2c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Simple text progress bar library";
    };
  };



  "nltk" = python.mkDerivation {
    name = "nltk-3.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/58/85/8fa6f8c488507aab7d6234ce754bbbe61bfeb8382489785e2d764bf8f52a/nltk-3.2.1.tar.gz";
      sha256= "d5533b2d7106ba33d1431a3e77b903c58f07433f0ea8f7a7bc9af2ea2d5c7d6a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Natural Language Toolkit";
    };
  };




  "pyasn1" = python.mkDerivation {
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      sha256= "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "ASN.1 types and codecs";
    };
  };



  "pycparser" = python.mkDerivation {
    name = "pycparser-2.14";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz";
      sha256= "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "C parser in Python";
    };
  };



  "selenium" = python.mkDerivation {
    name = "selenium-2.53.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c6/3c/b07ce83ed5a62b2eb8dd4c48f3f293197f70d63e537be14ec5d2bd328cc9/selenium-2.53.0.tar.gz";
      sha256= "579569ba3492cd102e7086ccbdb151af87b48b25ad2702346a9d2ace8615f4e1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Python bindings for Selenium";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256= "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2 and 3 compatibility utilities";
    };
  };



  "warcprox" = python.mkDerivation {
    name = "warcprox-1.4";
    src = pkgs.fetchgit {
      url = https://github.com/internetarchive/warcprox.git;
      rev = "f79e744";
      sha256= "1sqlp2yd3rgm70gyv54a04p98d6nl5hhl2qw5xglz120pb68bdfy";
      leaveDotGit = true;
    };
    doCheck = commonDoCheck;
    buildInputs = [ pkgs.git ] ++ commonBuildInputs;
    propagatedBuildInputs = [
      self."certauth"
      self."warctools"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl1;
      description = "WARC writing MITM HTTP/S proxy";
    };
  };



  "warctools" = python.mkDerivation {
    name = "warctools-4.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e6/5b/17eacaa14dde83dbecb62be44c21c5e9b8f2c709c1da5846e361c3033f3b/warctools-4.10.0.tar.gz";
      sha256= "ce0c6e274db8ac8810f7c97b3943e8e8deadbc3f5c982db77cddaae2d2ae6170";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Command line tools and libraries for handling and manipulating WARC files (and HTTP contents)";
    };
  };

}
