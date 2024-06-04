{ config, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common
  ];

  networking.hostName = "titan";

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  system.stateVersion = "23.11";
}
