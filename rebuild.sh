#!/bin/bash
set -e
pushd ~/.nixos-config/
nvim ./hosts/desktop/configuration.nix
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ~/.nixos-config#desktop
git commit -am "update"
popd
