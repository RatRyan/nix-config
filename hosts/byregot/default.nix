{ pkgs, inputs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common/global
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
