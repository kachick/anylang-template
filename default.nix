{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/23.05.tar.gz") { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.dprint
    pkgs.typos
  ];
}
