{
  inputs = {
    # Candidates
    #   - https://releases.nixos.org/?prefix=nixpkgs/
    #   - https://github.com/kachick/nixpkgs-url
    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
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
              pkgs.bashInteractive

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
