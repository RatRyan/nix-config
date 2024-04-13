{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../common/optional/nvidia.nix
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
