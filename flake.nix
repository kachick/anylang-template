{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShellNoCC {
            # Correct nixd inlay hints
            env.NIX_PATH = "nixpkgs=${nixpkgs.outPath}";

            buildInputs = (
              with pkgs;
              [
                # https://github.com/NixOS/nix/issues/730#issuecomment-162323824
                bashInteractive
                findutils # xargs
                nixfmt-rfc-style
                nixd
                go-task

                dprint
                typos
              ]
            );
          };
        }
      );
    };
}
