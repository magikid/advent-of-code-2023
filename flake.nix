{
  description = "Advent of Code 2023 Elixir dev environment";

  inputs = {
    # using unstable branch for the latest packages of nixpkgs
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; }; 
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
        elixir = pkgs.beam.packages.erlang.elixir;
        elixir-ls = pkgs.beam.packages.erlang.elixir_ls;
        locales = pkgs.glibcLocales;
        nodejs = pkgs.nodejs-18_x;
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            elixir
            nodejs
            locales
          ];
        };
      }
    );
}
