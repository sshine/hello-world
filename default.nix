{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  # This derivation produces a Nix package
  name = "hello-world";
  version = "0.1.0";
  src = ./.;

  # Build dependencies
  nativeBuildInputs = with pkgs; [
    rustc
    cargo
    pkg-config
  ];

  # Runtime dependencies
  buildInputs = with pkgs; [
    openssl
  ];

  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/hello-world $out/bin/
  '';

  doCheck = true;
  checkPhase = ''
    cargo test
  '';
}
