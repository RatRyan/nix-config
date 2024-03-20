{ config, pkgs, lib, ... }:
{
  imports = [
    ../common/global
    ../common/optional/nvidia.nix
    ../common/optional/colemakdh.nix

    ./hardware-configuration.nix 
  ];
}
