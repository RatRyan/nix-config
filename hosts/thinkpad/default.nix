{ config, pkgs, lib, ... }:
{
  imports = [
    ../common/global
    ../common/optional/colemakdh.nix

    ./hardware-configuration.nix 
  ];
}
