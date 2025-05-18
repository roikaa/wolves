{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs;[
# some pkgs i wanna use in this project 
    prisma-engines
    prisma
    firefox-devedition
  ];

# prisma nixos env var
  shellHook = ''
    export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
    export PRISMA_SCHEMA_ENGINE_BINARY="${pkgs.prisma-engines}/bin/schema-engine"
    export PRISMA_QUERY_ENGINE_BINARY="${pkgs.prisma-engines}/bin/query-engine"
    export PRISMA_QUERY_ENGINE_LIBRARY="${pkgs.prisma-engines}/lib/libquery_engine.node"
    export PRISMA_FMT_BINARY="${pkgs.prisma-engines}/bin/prisma-fmt"
  '';
}
