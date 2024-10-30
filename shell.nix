let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = [
      pkgs.rustup
      pkgs.pkg-config
      pkgs.openssl
    ];
  }
