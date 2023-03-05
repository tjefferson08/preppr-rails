# latest commit on nixpkgs-unstable branch
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/52dc75a4fee3fdbcb792cb6fba009876b912bfe0.tar.gz") {} }:

# pkgs.dockerTools.buildImage {
#   name = "preppr-rails-nix-docker";
#   config = {
#     Cmd = [ "bin/rails routes" ];
#   };
# }

pkgs.mkShell {
  buildInputs = [
    pkgs.ruby_3_1
    pkgs.sqlite
    pkgs.tzdata
    pkgs.flyctl
  ];
}
