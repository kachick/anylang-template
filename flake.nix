{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  };

  outputs =
    {
      nixpkgs,
      ...
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
                nixfmt # nixfmt-rfc-style is now nixfmt: https://github.com/NixOS/nixpkgs/pull/425068
                nixfmt-tree
                nixd
                go-task

                dprint
                typos
                zizmor
              ]
            );
          };
        }
      );
    };
}
