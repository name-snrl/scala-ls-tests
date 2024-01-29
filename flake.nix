{
  description = "A minimal flake with a devShell.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; config.allowUnfree = true; };
      {
        devShells.default =
          let
            bazel-fhs = buildFHSEnv {
              name = "bazel";
              runScript = "bazel";
              targetPkgs = p: [ p.bazel p.zlib ];
            };
          in
          mkShell {
            packages = [
              bazel-fhs
              bazel-buildtools
              sbt
              jdk17
              scalafmt
              metals
              vscode-fhs
            ];
          };
      });
}
