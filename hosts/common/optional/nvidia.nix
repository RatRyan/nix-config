{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
