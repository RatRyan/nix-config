#!/bin/bash
set -e
pushd ~/.nixos-config/
nvim ./hosts/desktop/configuration.nix
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-reebuild switch --flake .#desktop &>nixos-switch.log || (
cat nixos-switch.log | grep --color error && false)
git commit -m "update"
popd
