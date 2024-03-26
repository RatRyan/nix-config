{ ... }: {

  imports = [
    ./hardware-configuration.nix

    ../common
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
