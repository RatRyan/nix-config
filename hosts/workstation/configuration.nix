{ pkgs, ... }:

{
  imports = [
    ../../roles/default

    ./hardware-configuration.nix
  ];
}

