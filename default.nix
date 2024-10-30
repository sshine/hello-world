{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  name = "hello-world";
  nativeBuildInputs = with pkgs; [
    rustup
    pkg-config
    openssl
  ];
}
