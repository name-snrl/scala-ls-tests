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
              neovim-unwrapped
              metals
              #(vscode-with-extensions.override {
              #  vscodeExtensions = [
              #    (vscode-utils.buildVscodeMarketplaceExtension {
              #      mktplcRef = {
              #        name = "metals";
              #        publisher = "scalameta";
              #        version = "1.27.0";
              #        sha256 = "sha256-ilqr0Z56553FtBG/e0cmu1uwUbWFSGe2mxfkTt6uyZs=";
              #      };
              #    })
              #  ];
              #})
            ];
          };
      });
}
