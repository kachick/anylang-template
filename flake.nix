{
  inputs = {
    # https://github.com/kachick/anylang-template/issues/17
    # https://discourse.nixos.org/t/differences-between-nix-channels/13998
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              # https://github.com/NixOS/nix/issues/730#issuecomment-162323824
              # https://github.com/kachick/dotfiles/pull/228
              bashInteractive

              nil
              nixpkgs-fmt
              dprint
              typos
              go-task
            ];
          };
      }
    );
}
