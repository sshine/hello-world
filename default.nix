{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage {
  name = "hello-world";
  version = "0.1.0";
  src = ./.;
  cargoHash = "sha256-V3zQbp7DPhtsACAgyh5QGksd/Wp0KQ9zIHye3w9a/+I=";

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
