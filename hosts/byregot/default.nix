{ ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/nvidia.nix
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
