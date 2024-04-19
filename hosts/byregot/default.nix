{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common
    ../common/optional/nvidia.nix
  ];

  networking.hostName = "byregot";

  system.stateVersion = "23.11";
}
