{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage {
  pname = "hello-world";
  version = "0.1.0";
  src = ./.;
  cargoHash = "sha256-fCWXZbZRVBKcr27Z8Pz+mNuE4l1T8/Bg3L74MjUe1AU=";

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

  buildPhase = ''cargo build --release'';
  checkPhase = ''cargo test'';
  installPhase = ''
    mkdir -p $out/bin
    cp target/release/hello-world $out/bin/
  '';

  doCheck = true;
}
