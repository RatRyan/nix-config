{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../common/nvidia.nix
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
